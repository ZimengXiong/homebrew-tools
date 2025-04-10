class CppTest < Formula
  desc "CPP Tester supporting testcases and comparing alternative algorithims"
  homepage "https://github.com/ZimengXiong/cpp_test"
  url "https://github.com/ZimengXiong/cpp_test/releases/download/v0.1.0/cpp_test-macos.tar.gz"
  sha256 "909b07af4aaca585dc08d7fd5c47fe7b8ba672b5547ebba9c68f2ca1cd9176a3"
  license "MIT"

  def install
    bin.install "cpp_test"
  end

  test do
    system "#{bin}/cpp_test", "--help"
  end
end

