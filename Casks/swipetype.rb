cask "swipetype" do
  version "0.1.2"
  sha256 "0c2f02a5f15ef1b64cf2c3757c39f117848782dfe0fde4c67f44fc595f74dd92"

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
