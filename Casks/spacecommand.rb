cask "spacecommand" do
  version "0.1.1"
  sha256 "33f6755fe21e3c0f16f5f6598a73a15d3e4aab15b82348b31c23c3ca503c802a"

  url "https://github.com/ZimengXiong/SpaceCommand/releases/download/v#{version}/SpaceCommand.app.zip"
  name "SpaceCommand"
  desc "Space navigation and management utility with Yabai support"
  homepage "https://github.com/ZimengXiong/SpaceCommand"

  depends_on macos: ">= :sonoma"

  app "SpaceCommand.app"

  zap trash: [
    "~/Library/Preferences/com.ZimengXiong.SpaceCommand.plist",
    "~/Library/Saved Application State/com.ZimengXiong.SpaceCommand.savedState"
  ]
end