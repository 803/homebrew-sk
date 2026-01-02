class SkAT016 < Formula
  desc "Skills Supply CLI - Install and manage AI agent skills"
  homepage "https://github.com/803/skills-supply"
  license "MIT"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-darwin-arm64.tar.gz"
      sha256 "6ed775fb05d50f17931317051235981b2724539c5dbd81df803604a95083a100" # sk-darwin-arm64
    else
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-darwin-x64.tar.gz"
      sha256 "8efd9a17b8a0e7c2fbd806e2a179b91643795c5f26d4b101b9c97815c4e9c8c1" # sk-darwin-x64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-linux-arm64.tar.gz"
      sha256 "9f21ee16881135f413108d40651bdb88e1751c2b23f4ceace0e96f6decf812b7" # sk-linux-arm64
    else
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-linux-x64.tar.gz"
      sha256 "503dc6023a8df9d0ce5d74615b45f1b6bebdcecb10d103a6e02fd9c03833efc5" # sk-linux-x64
    end
  end

  def install
    bin.install "sk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sk --version")
  end
end
