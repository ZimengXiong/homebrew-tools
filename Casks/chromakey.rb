cask "chromakey" do
  version "0.2.9"
  sha256 "3181198872e132e495bbc9223d4055f4f129ac179ee2c3d0a0401bcd255c7e7d"

  url "https://github.com/ZimengXiong/chromakey/releases/download/v#{version}/VerificationCodeShortcut-#{version}.zip"
  name "Chromakey"
  homepage "https://github.com/ZimengXiong/chromakey"

  depends_on macos: :sonoma

  app "Chromakey.app", target: "#{Dir.home}/Applications/Chromakey.app"

  preflight_steps do
    terminate_process "VerificationCodeShortcut", match: :name
    run "/bin/launchctl", args: ["bootout", "gui/#{Process.uid}/local.zimeng.verification-code-shortcut"],
        must_succeed: false, print_stderr: false
  end

  postflight do
    path = "#{Dir.home}/Applications/Chromakey.app"
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", path], must_succeed: false
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister", args: ["-f", path]
    agent = Pathname("#{Dir.home}/Library/LaunchAgents/local.zimeng.verification-code-shortcut.plist")
    agent.dirname.mkpath
    agent.write <<~PLIST
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0"><dict>
      <key>Label</key><string>local.zimeng.verification-code-shortcut</string>
      <key>ProgramArguments</key><array><string>#{path}/Contents/MacOS/VerificationCodeShortcut</string><string>--background</string></array>
      <key>RunAtLoad</key><true/>
      <key>LimitLoadToSessionType</key><string>Aqua</string>
      <key>ProcessType</key><string>Interactive</string>
      </dict></plist>
    PLIST
    system_command "/bin/launchctl", args: ["bootout", "gui/#{Process.uid}/local.zimeng.verification-code-shortcut"], must_succeed: false, print_stderr: false
    system_command "/bin/launchctl", args: ["bootstrap", "gui/#{Process.uid}", agent.to_s]
  end

  uninstall launchctl: "local.zimeng.verification-code-shortcut"

  uninstall_preflight_steps do
    terminate_process "VerificationCodeShortcut", match: :name
  end

  uninstall_postflight_steps do
    remove "#{Dir.home}/Library/LaunchAgents/local.zimeng.verification-code-shortcut.plist"
  end
end
