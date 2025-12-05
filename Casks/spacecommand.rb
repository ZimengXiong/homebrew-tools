cask "spacecommand" do
  version "0.1.1"
  sha256 "29802e5ddfd90b194e8e5ef6c5acbbad0065451ae6d35674b6178cf78a8fe53e"

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