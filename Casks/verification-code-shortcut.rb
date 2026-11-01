require_relative "../lib/verification_code_shortcut_download_strategy"

cask "verification-code-shortcut" do
  version "0.1.4"
  sha256 "67de0221793e23760f1392f779f8d39a0e6de37d70811a92992ab05e87972a5a"

  url "https://github.com/ZimengXiong/verification-code-shortcut/releases/download/v#{version}/VerificationCodeShortcut-#{version}.zip",
      using: VerificationCodeShortcutDownloadStrategy
  name "Verification Code Shortcut"
  homepage "https://github.com/ZimengXiong/verification-code-shortcut"

  depends_on macos: :sonoma
  depends_on formula: "gh"

  app "Verification Code Shortcut.app", target: "#{Dir.home}/Applications/Verification Code Shortcut.app"

  preflight_steps do
    run "/bin/launchctl", args: ["bootout", "gui/#{Process.uid}/local.zimeng.verification-code-shortcut"],
        must_succeed: false, print_stderr: false
  end

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{Dir.home}/Applications/Verification Code Shortcut.app"],
        writable_paths: ["#{Dir.home}/Applications/Verification Code Shortcut.app"], must_succeed: false
    mkdir_p "#{Dir.home}/Library/LaunchAgents"
    write_file "#{Dir.home}/Library/LaunchAgents/local.zimeng.verification-code-shortcut.plist", <<~PLIST
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0"><dict>
      <key>Label</key><string>local.zimeng.verification-code-shortcut</string>
      <key>ProgramArguments</key><array><string>#{Dir.home}/Applications/Verification Code Shortcut.app/Contents/MacOS/VerificationCodeShortcut</string></array>
      <key>RunAtLoad</key><true/>
      <key>LimitLoadToSessionType</key><string>Aqua</string>
      <key>ProcessType</key><string>Interactive</string>
      </dict></plist>
    PLIST
    run "/bin/launchctl", args: ["bootstrap", "gui/#{Process.uid}", "#{Dir.home}/Library/LaunchAgents/local.zimeng.verification-code-shortcut.plist"]
  end

  uninstall launchctl: "local.zimeng.verification-code-shortcut",
            quit: "local.zimeng.verification-code-shortcut"

  uninstall_postflight_steps do
    remove "#{Dir.home}/Library/LaunchAgents/local.zimeng.verification-code-shortcut.plist"
  end
end
