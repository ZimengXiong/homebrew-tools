cask "spacecommand" do
  version "0.1.1"
  sha256 "ad1e94e5d17a8d276105807c78690e5d0c3af84fea806b6fc6038f25914d5371"

  # Ensure your git tags match this pattern (e.g., 'v0.1.1')
  url "https://github.com/ZimengXiong/SpaceCommand/releases/download/v#{version}/SpaceCommand.app.zip"
  name "SpaceCommand"
  desc "Space navigation and management utility with Yabai support"
  homepage "https://github.com/ZimengXiong/SpaceCommand"

  # STRICT REQUIREMENT: Matches project.yml deployment target
  depends_on macos: ">= :sonoma"

  app "SpaceCommand.app"

  # CORRECTED: cleanup paths based on actual source code usage
  zap trash: [
    "~/Library/Preferences/com.ZimengXiong.SpaceCommand.plist",
    "~/Library/Saved Application State/com.ZimengXiong.SpaceCommand.savedState"
  ]
end