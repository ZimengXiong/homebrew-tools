cask "namigen" do
  version "0.2.3"
  sha256 :no_check 
  
  url "https://github.com/iamgeo92/mac-app/releases/download/#{version}/Namigen_#{version}_arm64.dmg"
  name "Namigen"
  desc "Name generator app for macOS (Apple Silicon)"
  homepage "https://github.com/iamgeo92/mac-app"

  app "Namigen.app"

  zap trash: [
    "~/Library/Application Support/Namigen",
    "~/Library/Preferences/com.iamgeo92.namigen.plist"
  ]
end
