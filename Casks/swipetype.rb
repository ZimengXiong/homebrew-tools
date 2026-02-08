cask "swipetype" do
  version "0.1.3"
  sha256 "59b146b8637554d091f9132a50ecbfbf96930966397374be0d8938b641b2b50b"

  url "https://github.com/ZimengXiong/swipeType/releases/download/v#{version}/SwipeType.dmg"
  name "SwipeType"
  desc "Swipe-to-type predictor for macOS"
  homepage "https://github.com/ZimengXiong/swipeType"

  depends_on macos: ">= :ventura"

  app "SwipeType.app"

  zap trash: [
    "~/Library/Preferences/com.swipetype.SwipeType.plist",
    "~/Library/Saved Application State/com.swipetype.SwipeType.savedState"
  ]
end
