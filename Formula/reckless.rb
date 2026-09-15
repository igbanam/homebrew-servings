class Reckless < Formula
  desc "LSP server for Ledger CLI and HLedger"
  homepage "https://github.com/igbanam/reckless"
  version "1.0.0"
  license "MIT"

  # macOS: separate native binaries for Apple Silicon and Intel.
  on_macos do
    on_arm do
      url "https://github.com/igbanam/homebrew-servings/releases/download/v#{version}/reckless-darwin-arm64.tar.gz"
      sha256 "df694feb6fa07f50e19235dafa2da54b01514dde9fa932f1307feee75b35db40"
    end

    on_intel do
      url "https://github.com/igbanam/homebrew-servings/releases/download/v#{version}/reckless-darwin-amd64.tar.gz"
      sha256 "a238c7fa4b0302ad49d3104ab67c31667f5d3ebd9f4a0e20efff835deb6448c2"
    end
  end

  # Linux (Intel/AMD64)
  on_linux do
    url "https://github.com/igbanam/homebrew-servings/releases/download/v#{version}/reckless-linux-amd64.tar.gz"
    sha256 "e43a26e5746de6fa934eff83bfeff7c44b40c6e191d43d81083e333a0d4bf441"
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
