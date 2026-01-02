class SkAT018 < Formula
  desc "Skills Supply CLI - Install and manage AI agent skills"
  homepage "https://github.com/803/skills-supply"
  license "MIT"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-darwin-arm64.tar.gz"
      sha256 "6a4dc18497f027061c6db3c396445f9f38fb49142fa3c86e77ee2c86ebccbfbf" # sk-darwin-arm64
    else
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-darwin-x64.tar.gz"
      sha256 "40c16b21598534fbf47ecd8da4edf16ea29bbc72364a35d9e66cbf44c96c62f0" # sk-darwin-x64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-linux-arm64.tar.gz"
      sha256 "bceb322599cf813c60a12e9d58393b4d162ba55910026947a1ef85295bacef9c" # sk-linux-arm64
    else
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-linux-x64.tar.gz"
      sha256 "a98a42c0757a1ad2535b3238f1755eaac38f3e8cf6b3cec24594f37e97bc0157" # sk-linux-x64
    end
  end

  def install
    bin.install "sk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sk --version")
  end
end
