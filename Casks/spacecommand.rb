cask "spacecommand" do
  version "0.1.1"
  sha256 "bb89e514fcd64b60ca91a50167953882f314440fc4070b0dda223e9bd9b791b2"

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