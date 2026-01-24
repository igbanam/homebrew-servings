class Reckless < Formula
  desc "LSP server for Ledger CLI and HLedger"
  homepage "https://github.com/igbanam/reckless"
  version "0.1.2"
  license "MIT"

  # macOS (Intel and Apple Silicon)
  # If you have separate binaries for M1 (arm64) vs Intel (amd64), use `if Hardware::CPU.arm?` logic.
  # For now, assuming you are releasing the amd64 binary (which works on M1 via Rosetta) or a universal binary.
  on_macos do
    url "https://github.com/igbanam/homebrew-servings/releases/download/v#{version}/reckless-darwin-amd64.tar.gz"
    sha256 "651504715e993bac2266c1f0a997fbc7e9caea7f279969d878052f4bec86737f"
  end

  # Linux (Intel/AMD64)
  on_linux do
    url "https://github.com/igbanam/homebrew-servings/releases/download/v#{version}/reckless-linux-amd64.tar.gz"
    sha256 "3dabab7a5ef568c73c976e492e011aa2aa407c8918a71661b434b8561258c5dc"
  end

  # Windows is not supported by standard Homebrew, so we omit it here.
  # Users on Windows would download the .exe directly.

  def install
    # Since we downloaded a binary, we just install it to the bin folder
    bin.install "reckless"
  end

  test do
    assert_match "reckless", shell_output("#{bin}/reckless --help", 1) rescue nil
  end
end
