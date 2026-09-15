class Reckless < Formula
  desc "LSP server for Ledger CLI and HLedger"
  homepage "https://github.com/igbanam/reckless"
  version "1.0.0"
  license "MIT"

  # macOS (Intel and Apple Silicon)
  # If you have separate binaries for M1 (arm64) vs Intel (amd64), use `if Hardware::CPU.arm?` logic.
  # For now, assuming you are releasing the amd64 binary (which works on M1 via Rosetta) or a universal binary.
  on_macos do
    url "https://github.com/igbanam/homebrew-servings/releases/download/v#{version}/reckless-darwin-amd64.tar.gz"
    sha256 "6eba19e8e425a0d2439779ff33ca0b173fe6125e7b8457e44ecdce255d092f9b"
  end

  # Linux (Intel/AMD64)
  on_linux do
    url "https://github.com/igbanam/homebrew-servings/releases/download/v#{version}/reckless-linux-amd64.tar.gz"
    sha256 "3717daba6f5c079a61b7f962e4ab14b58202dafa01bef2d05fcdcf103950cdb0"
  end

  # Windows is not supported by standard Homebrew, so we omit it here.
  # Users on Windows would download the .exe directly.

  def install
    # Since we downloaded a binary, we just install it to the bin folder
    bin.install "reckless"
  end

  test do
    # reckless is an LSP server (speaks over STDIN/STDOUT, no CLI flags),
    # so there's no --help output to assert on; just verify the install.
    assert_path_exists bin/"reckless"
    assert_predicate bin/"reckless", :executable?
  end
end
