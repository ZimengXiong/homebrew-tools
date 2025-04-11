class CppTest < Formula
  desc "CPP Tester supporting testcases and comparing alternative algorithims"
  homepage "https://github.com/ZimengXiong/cpp_test"
  url "https://github.com/ZimengXiong/cpp_test/releases/download/v0.1.1/cpp_test-macos.tar.gz"
  sha256 "28e250c0739434282c4e82300124d58e27ba05b66a3652525a49d7134cc210cc"
  license "MIT"

  def install
    bin.install "cpp_test"
  end

  test do
    system "#{bin}/cpp_test", "--help"
  end
end

