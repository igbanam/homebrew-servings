class Orgchart < Formula
  desc "Render ASCII org charts from an indentation-based DSL"
  homepage "https://github.com/igbanam/orgchart"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/igbanam/orgchart/releases/download/v0.1.0/orgchart-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "24a7d80d7f2bccdde2a27bf5145880998de7cab5e532cd7cf40f22452b4d65e9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/igbanam/orgchart/releases/download/v0.1.0/orgchart-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "0f851c181ab7da9eb65eb17a3b94fca757f0ff3576217c3ae01d7f094220f6b3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/igbanam/orgchart/releases/download/v0.1.0/orgchart-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76e1d79d5c7602e6693d2dd93abad3a2b5b932872c17535bfa756ba2422245b2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/igbanam/orgchart/releases/download/v0.1.0/orgchart-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "134f952a0934fba1f0b79299720f19353481f6855cc3014b111aed829b6ee145"
    end
  end

  def install
    bin.install "orgchart"
  end

  test do
    assert_match "orgchart", shell_output("#{bin}/orgchart --version")
  end
end
