cask "aquarium" do
  version "0.1.10"
  sha256 "50a209a04800d5f6e0f5bde66152a2d35ae4c1d57889e00ffc39fdc3e30ea2f6"

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
