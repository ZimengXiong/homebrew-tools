class Mm < Formula
  desc "A simple molecular weight calculator implemented in Rust"
  homepage "https://github.com/zimengxiong/cli-molecular-weight-calculator"
  url "https://github.com/ZimengXiong/cli-molecular-weight-calculator/releases/download/v0.1.1/mm-macos.tar.gz"
  sha256 "1630c30ac3c877b33005d1c272849a97a28215c56bb25c4f2be774173fd88140"

  def install
    bin.install "mm"
  end

  test do
    system "#{bin}/mm", "--help"
  end

end
