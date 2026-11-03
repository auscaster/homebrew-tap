class Ugt < Formula
  desc "Get GitHub projects running on your computer, with your AI app"
  homepage "https://usegithubthing.com"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/auscaster/ugt/releases/download/v0.2.1/ugt-darwin-arm64"
      sha256 "036f6d1b882fef2026d0c05ebaa32fe38e68e794dd41e45211b69e017cff03c4"
    end
    on_intel do
      url "https://github.com/auscaster/ugt/releases/download/v0.2.1/ugt-darwin-amd64"
      sha256 "2aeeb599fc3cb3fad8d4c6759c9f1367a9f18b6dc275970e78eedf211e74c3bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/auscaster/ugt/releases/download/v0.2.1/ugt-linux-arm64"
      sha256 "a4514b4585c55c7235b6237d430354d6d379e865c71bfcaeeb2acc92b0090200"
    end
    on_intel do
      url "https://github.com/auscaster/ugt/releases/download/v0.2.1/ugt-linux-amd64"
      sha256 "69d084c1a4c3afecfb60647cf2e283003c31750a780b91115969323b79b4cb0b"
    end
  end

  def install
    bin.install Dir["ugt-*"].first => "ugt"
  end

  test do
    assert_match "ugt #{version}", shell_output("#{bin}/ugt version")
  end
end
