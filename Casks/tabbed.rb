cask "tabbed" do
  version "0.1.2"
  sha256 "57b417f5bb2739be5e2865a3ef188cf60ec5119853b6f05a50b3a9ab0f2222b5"

  url "https://github.com/ZimengXiong/tabbed/releases/download/v0.1.2/Tabbed.app.zip"
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
