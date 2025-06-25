cask "rightclickmenubar" do
  version "0.1.0"
  sha256 :no_check

  url "https://github.com/ZimengXiong/right-click-menubar/releases/download/V0.1.0/RightClickMenubar.zip"
  name "Right Click Menubar"
  desc "Access to the Application Menu in Context Menu at Cursor"
  homepage "https://github.com/ZimengXiong/right-click-menubar"

  app "Right Click Menubar.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Right Click Menubar.app"]
  end

  zap trash: [
    "~/Library/Application Support/Right Click Menubar",
    "~/Library/Preferences/com.zimengxiong.right-click-menubar.plist"
  ]
end
