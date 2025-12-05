cask "spacecommand" do
  version "0.1.1"
  sha256 "2f0dc0fd423b9a17d981239d5df2ea10c74a00f84c06cd36004426836acfb086"

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