class SkAT017 < Formula
  desc "Skills Supply CLI - Install and manage AI agent skills"
  homepage "https://github.com/803/skills-supply"
  license "MIT"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-darwin-arm64.tar.gz"
      sha256 "7232df98b40766957159b821552f3a1b3065ea3c302119dd6a3e72f167e04e24" # sk-darwin-arm64
    else
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-darwin-x64.tar.gz"
      sha256 "a36b7516d59f9def393878e1c8fae17aaa5e016abb0451236dac2a50f1de8165" # sk-darwin-x64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-linux-arm64.tar.gz"
      sha256 "a3fb1894355ff9cb3ca329a50c4840b8095ad5149ef93431376fa2d5d32f930c" # sk-linux-arm64
    else
      url "https://github.com/803/skills-supply/releases/download/sk@#{version}/sk-linux-x64.tar.gz"
      sha256 "6b88ab53dcfa5c8689578405025bc808ce103d50a20930bc8b99abdb1a094f07" # sk-linux-x64
    end
  end

  def install
    bin.install "sk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sk --version")
  end
end
