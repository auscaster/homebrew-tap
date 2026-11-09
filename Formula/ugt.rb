class Ugt < Formula
  desc "Get open-source GitHub projects running on your computer, with your AI app"
  homepage "https://usegeekthing.com"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/usegeekthing/ugt/releases/download/v0.3.1/ugt-darwin-arm64"
      sha256 "c4c110ff5fc3bf461af4b4ab972ac863578ab769654b8c71b6fb17d11459368f"
    end
    on_intel do
      url "https://github.com/usegeekthing/ugt/releases/download/v0.3.1/ugt-darwin-amd64"
      sha256 "caf5c2d6aab35d76ee1d3c8691e22a896f7b3394d943a0a6d3414c70346317a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/usegeekthing/ugt/releases/download/v0.3.1/ugt-linux-arm64"
      sha256 "1167c17aa1d7a93d8a2d702989cb2249482eb1fdd3e9199632b26bd8368503fe"
    end
    on_intel do
      url "https://github.com/usegeekthing/ugt/releases/download/v0.3.1/ugt-linux-amd64"
      sha256 "c622628f21077a43ed607bf3fc211af502a991308744428b9fa341151cb43626"
    end
  end

  def install
    bin.install Dir["ugt-*"].first => "ugt"
  end

  test do
    assert_match "ugt #{version}", shell_output("#{bin}/ugt version")
  end
end
