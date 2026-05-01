cask "aquarium" do
  version "0.1.1"
  sha256 "9b42fc85f788e11880a178dd9e23a62bac367438180a1d0cd59ed001a2a22837"

  url "https://github.com/ZimengXiong/aquarium/releases/download/v#{version}/Aquarium-#{version}.zip"
  name "Aquarium"
  desc "Keep a Mac awake when the lid is closed"
  homepage "https://github.com/ZimengXiong/aquarium"

  depends_on macos: ">= :sonoma"

  app "Aquarium.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Aquarium.app"]
  end

  uninstall quit: "com.aquarium.app"

  zap trash: [
    "~/Library/Preferences/com.aquarium.app.plist"
  ]

  caveats do
    <<~EOS
      Open Aquarium once after installation. The app installs or updates its privileged helper on launch and macOS will ask for administrator approval.
    EOS
  end
end
