cask "tabbed" do
  version "0.1.1"
  sha256 "abcc9aaa8f0cabe120a2a49439a508b5c74754ad313e6a41ff6a96983909e9df"

  url "https://github.com/ZimengXiong/tabbed/releases/download/v0.1.1/Tabbed.app.zip"
  name "Tabbed"
  desc "Command-drag macOS windows into lightweight tab stacks"
  homepage "https://github.com/ZimengXiong/tabbed"

  depends_on macos: :sonoma

  app "Tabbed.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Tabbed.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.local.Tabbed.plist",
    "~/Library/Saved Application State/dev.local.Tabbed.savedState"
  ]
end
