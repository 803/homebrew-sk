class SkAT022 < Formula
  desc "Skills Supply CLI - Install and manage AI agent skills"
  homepage "https://github.com/803/skills-supply"
  license "MIT"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-darwin-arm64.tar.gz"
      sha256 "59f9375257ea90da970a202d5968caed669734ffbc145b97f5c1eec1967b5e0c" # sk-darwin-arm64
    else
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-darwin-x64.tar.gz"
      sha256 "c372296c5837b8013739b821a07a1195dd248c3b93e227bb206d36b27dfa2c44" # sk-darwin-x64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-linux-arm64.tar.gz"
      sha256 "0d9a595d9f671330d971d508ecdf0ddbf30c00ed3c837a2b68545573534ff726" # sk-linux-arm64
    else
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-linux-x64.tar.gz"
      sha256 "4417f5dd0483da121fdd0816202a5f859c877ea52500773b3662f668b647e5cc" # sk-linux-x64
    end
  end

  def install
    bin.install "sk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sk --version")
  end
end
