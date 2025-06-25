cask "rightclickmenubar" do
  version "0.1.1"
  sha256 :no_check

  url "https://github.com/ZimengXiong/right-click-menubar/releases/download/V0.1.1/RightClickMenubar.zip"
  name "RightClickMenubar"
  desc "Access to the Application Menu in Context Menu at Cursor"
  homepage "https://github.com/ZimengXiong/right-click-menubar"

  app "RightClickMenubar.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/RightClickMenubar.app"]
  end

  zap trash: [
    "~/Library/Application Support/RightClickMenubar",
    "~/Library/Preferences/com.zimengxiong.rightclickmenubar.plist"
  ]
end
