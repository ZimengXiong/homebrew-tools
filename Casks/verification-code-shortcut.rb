require_relative "../lib/verification_code_shortcut_download_strategy"

cask "verification-code-shortcut" do
  version "0.1.2"
  sha256 "ff144cd49484e81a1e46e0a5393c68c1bb9ff5d1b60a3385fda70a8ba8d88d4c"

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
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{home}}/Applications/Verification Code Shortcut.app"],
        writable_paths: ["{{home}}/Applications/Verification Code Shortcut.app"], must_succeed: false
    mkdir_p "{{home}}/Library/LaunchAgents"
    write_file "{{home}}/Library/LaunchAgents/local.zimeng.verification-code-shortcut.plist", <<~PLIST
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
    run "/bin/launchctl", args: ["bootstrap", "gui/#{Process.uid}", "{{home}}/Library/LaunchAgents/local.zimeng.verification-code-shortcut.plist"]
  end

  uninstall launchctl: "local.zimeng.verification-code-shortcut",
            quit: "local.zimeng.verification-code-shortcut",
            delete: "~/Library/LaunchAgents/local.zimeng.verification-code-shortcut.plist"
end
