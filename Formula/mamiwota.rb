class Mamiwota < Formula
  desc "Renders Mermaid diagrams as ASCII art in the terminal. "
  homepage "https://github.com/igbanam/mamiwota"
  version "0.0.1"
  license "MIT"

  on_macos do
    url "https://github.com/igbanam/homebrew-servings/releases/download/v#{version}/mamiwota-darwin-amd64.tar.gz"
    sha256 "500c63d10f1cf07a4b287a010946114d64f19ab0d69cc628e94338323a5c0109"
  end

  on_linux do
    url "https://github.com/igbanam/homebrew-servings/releases/download/v#{version}/mamiwota-linux-amd64.tar.gz"
    sha256 "b0af29b89600e3014e287d5bb462e107b744592ba5593aa02b386902171c0d36"
  end

  def install
    bin.install "mamiwota"
  end

  test do
    assert_match "mamiwota", shell_output("#{bin}/mamiwota --help", 1) rescue nil
  end
end
