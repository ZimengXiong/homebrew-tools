cask "swipetype" do
  version "0.1.4"
  sha256 "3b340a016102879cf85e8585b7fb88caf9f1b819de62376c732503c80751990f"

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
