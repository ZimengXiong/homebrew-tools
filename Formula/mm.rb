class Mm < Formula
  desc "A simple molecular weight calculator implemented in Rust"
  homepage "https://github.com/zxzimeng/cli-molecular-weight-calculator"
  url "https://github.com/zxzimeng/cli-molecular-weight-calculator/releases/download/v0.1.1/v0.1.1.tar.gz"
  sha256 "fe57541c6a263e4518e999024cd98cf016a9eb2b4dd559eea491c96868ea0dd3"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end