class Mm < Formula
  desc "A simple molecular weight calculator implemented in Rust"
  homepage "https://github.com/zimengxiong/cli-molecular-weight-calculator"
  url "https://github.com/ZimengXiong/cli-molecular-weight-calculator/releases/download/v0.1.1/mm-macos.tar.gz"
  sha256 "f7dc2967b904fc166094669e1d53deedcfd8b091b264d187d3f0213c64060d84"

  def install
    bin.install "mm"
  end

  test do
    system "#{bin}/mm", "--help"
  end

end
