class Sk < Formula
  desc "Skills Supply CLI - Install and manage AI agent skills"
  homepage "https://github.com/803/skills-supply"
  license "MIT"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-darwin-arm64.tar.gz"
      sha256 "f03c2d77f4033abfd4a776da071792ba7aebfeb5a904157619f6865d31757a39" # sk-darwin-arm64
    else
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-darwin-x64.tar.gz"
      sha256 "3e44e3cc1a6f8d4c39b994412a2c5460a5ef52100f16e429fe110bb3e8705c32" # sk-darwin-x64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-linux-arm64.tar.gz"
      sha256 "f39e355379d4949777d892cff2ec29f4edaa425fd3f233fd8b603994deba8456" # sk-linux-arm64
    else
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-linux-x64.tar.gz"
      sha256 "82166afe841fae1deaf54dec0e579fe0115f59124da2b7841f85653c7ba6cfcc" # sk-linux-x64
    end
  end

  def install
    bin.install "sk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sk --version")
  end
end
