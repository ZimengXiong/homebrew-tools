class CppTest < Formula
  desc "CPP Tester supporting testcases and comparing alternative algorithims"
  homepage "https://github.com/ZimengXiong/cpp_test"
  url "https://github.com/ZimengXiong/cpp-test/releases/download/v0.1.3/cpp-test-macos.tar.gz"
  sha256 "1578d2d84d71b4d031cf9f40f4b458b77ecd09ad25efa72ea014533b1ed136bc"
  license "MIT"

  def install
    bin.install "cpp_test"
  end

  test do
    system "#{bin}/cpp_test", "--help"
  end
end

