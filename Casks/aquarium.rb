cask "aquarium" do
  version "0.1.8"
  sha256 "db9855b98587a9659af80124e4874abedbf30ade9b5d6f787286e6f02dd4a9d3"

  url "https://github.com/ZimengXiong/aquarium/releases/download/v#{version}/Aquarium-#{version}.zip"
  name "Aquarium"
  desc "Keep a Mac awake when the lid is closed"
  homepage "https://github.com/ZimengXiong/aquarium"

  depends_on macos: ">= :sonoma"

  app "Aquarium.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Aquarium.app"],
                   sudo: true
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
