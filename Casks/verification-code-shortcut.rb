require_relative "../lib/verification_code_shortcut_download_strategy"

cask "verification-code-shortcut" do
  version "0.2.0"
  sha256 "638a64fda5b61ecb8ce08517af211503920d567da94f240ead661832cc848b34"

  url "https://github.com/ZimengXiong/verification-code-shortcut/releases/download/v#{version}/VerificationCodeShortcut-#{version}.zip",
      using: VerificationCodeShortcutDownloadStrategy
  name "Chromakey"
  homepage "https://github.com/ZimengXiong/verification-code-shortcut"

  depends_on macos: :sonoma
  depends_on formula: "gh"

  app "Chromakey.app", target: "#{Dir.home}/Applications/Chromakey.app"

  preflight_steps do
    run "/bin/launchctl", args: ["bootout", "gui/#{Process.uid}/local.zimeng.verification-code-shortcut"],
        must_succeed: false, print_stderr: false
  end

  postflight do
    path = "#{Dir.home}/Applications/Chromakey.app"
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", path], must_succeed: false
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

  uninstall launchctl: "local.zimeng.verification-code-shortcut",
            quit: "local.zimeng.verification-code-shortcut"

  uninstall_postflight_steps do
    remove "#{Dir.home}/Library/LaunchAgents/local.zimeng.verification-code-shortcut.plist"
  end
end
