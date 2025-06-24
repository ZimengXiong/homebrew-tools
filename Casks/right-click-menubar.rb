cask "right-click-menubar" do
  version "0.1.0"
  sha256 :no_check

  url "https://github.com/ZimengXiong/right-click-menubar/releases/download/V0.1.0/Right.Click.Menubar.zip"
  name "Right Click Menubar"
  desc "Access to the Application Menu in Context Menu at Cursor"
  homepage "https://github.com/ZimengXiong/right-click-menubar"

  app "Right Click Menubar.app"

  zap trash: [
    "~/Library/Application Support/Right Click Menubar",
    "~/Library/Preferences/com.zimengxiong.right-click-menubar.plist"
  ]
end
