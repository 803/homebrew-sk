class Sk < Formula
  desc "Skills Supply CLI - Install and manage AI agent skills"
  homepage "https://github.com/skills-supply/skillssupply"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/skills-supply/skillssupply/releases/download/v#{version}/sk-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER" # sk-darwin-arm64
    else
      url "https://github.com/skills-supply/skillssupply/releases/download/v#{version}/sk-darwin-x64.tar.gz"
      sha256 "PLACEHOLDER" # sk-darwin-x64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/skills-supply/skillssupply/releases/download/v#{version}/sk-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER" # sk-linux-arm64
    else
      url "https://github.com/skills-supply/skillssupply/releases/download/v#{version}/sk-linux-x64.tar.gz"
      sha256 "PLACEHOLDER" # sk-linux-x64
    end
  end

  def install
    bin.install "sk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sk --version")
  end
end
