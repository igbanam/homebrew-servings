class HledgerCal < Formula
  desc "Calendar view of income and expenses for HLedger"
  homepage "https://github.com/igbanam/hledger-cal"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/igbanam/hledger-cal/releases/download/v0.1.0.1/hledger-cal-v0.1.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "0d228788068480ca43c71f68ef6ab2ae36323b86dea54ec46e1e2d419a2f1cf1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/igbanam/hledger-cal/releases/download/v0.1.0.1/hledger-cal-v0.1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "32faaf2f60568f467f1f3b8f76dc1ff381acc2f9caddb2f1a31c753d5df576ad"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/igbanam/hledger-cal/releases/download/v0.1.0.1/hledger-cal-v0.1.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "086f8e79bc066eda2dab8a7ee67fc6ddc71999a51edce28b315ddd3cafb868dc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/igbanam/hledger-cal/releases/download/v0.1.0.1/hledger-cal-v0.1.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ff6b8811c7dd2a2e69218ad7949c5d01f5b3a1154930fa7954094fe71bd5089"
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
    assert_equal "hledger-cal #{version}\n", shell_output("#{bin}/hledger-cal --version")
  end
end
