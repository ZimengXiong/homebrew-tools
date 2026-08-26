class MacAutoRotate < Formula
  desc "Rotate a MacBook display from its SPU motion sensor"
  homepage "https://github.com/ZimengXiong/macAutoRotate"
  url "https://github.com/ZimengXiong/macAutoRotate/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "77bb33ea335c33259144e61658a79f54ee9781cf472ade8f13548c1d77c87bff"
  license "MIT"

  depends_on "rust" => :build
  depends_on "displayplacer"
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/macAutoRotate", "--help"
  end
end
