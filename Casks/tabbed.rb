cask "tabbed" do
  version "0.1.1"
  sha256 "abcc9aaa8f0cabe120a2a49439a508b5c74754ad313e6a41ff6a96983909e9df"

  url "https://api.github.com/repos/ZimengXiong/tabbed/releases/assets/448676567",
      header: [
        "Accept: application/octet-stream",
        "Authorization: token #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}"
      ]
  name "Tabbed"
  desc "Command-drag macOS windows into lightweight tab stacks"
  homepage "https://github.com/ZimengXiong/tabbed"

  depends_on macos: :sonoma

  app "Tabbed.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Tabbed.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.local.Tabbed.plist",
    "~/Library/Saved Application State/dev.local.Tabbed.savedState"
  ]
end
