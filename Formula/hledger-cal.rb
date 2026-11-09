class HledgerCal < Formula
  desc "Calendar view of income and expenses for HLedger"
  homepage "https://github.com/igbanam/hledger-cal"
  version "0.1.0.0"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/igbanam/hledger-cal/releases/download/v0.1.0.0/hledger-cal-v0.1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "f5ebb157e6af13884bba1c3f20b06d2b10a643cd6cdc06fde7fce6fa67b489b1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/igbanam/hledger-cal/releases/download/v0.1.0.0/hledger-cal-v0.1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "444180a82aa83f9d2aa039e119b1f1485497fdcd6031d06f176b55fde765582b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/igbanam/hledger-cal/releases/download/v0.1.0.0/hledger-cal-v0.1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "90fa5c6578eb9cd83bc2c98be648ed7b4683b28bf331ae7e6d354f51bcaf6b2b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/igbanam/hledger-cal/releases/download/v0.1.0.0/hledger-cal-v0.1.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8adfce6859c898ed1314a09c493eae4c8241ac74efa6ac8647aa3d11c766bb2c"
    end
  end

  def install
    bin.install "hledger-cal"
  end

  def caveats
    <<~EOS
      hledger-cal is an hledger add-on. With hledger installed, run it as:
        hledger cal
    EOS
  end

  test do
    assert_match "Show income and expenses as a calendar", shell_output("#{bin}/hledger-cal --help")
  end
end
