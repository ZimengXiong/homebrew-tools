cask "swipetype" do
  version "0.1.1"
  sha256 "bceb33174e8228618fbd053a9b14c8847ec37d78b3025bcbc74c4e4cb16b0215"

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
