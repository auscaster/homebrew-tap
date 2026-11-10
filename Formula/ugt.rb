class Ugt < Formula
  desc "Get open-source GitHub projects running on your computer, with your AI app"
  homepage "https://usegeekthing.com"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/usegeekthing/ugt/releases/download/v0.3.2/ugt-darwin-arm64"
      sha256 "ba3db945063fc0148f28a10beff0ce698978c5cd0cdd20bc98e816429884c535"
    end
    on_intel do
      url "https://github.com/usegeekthing/ugt/releases/download/v0.3.2/ugt-darwin-amd64"
      sha256 "4853a37180dc6e21a0b3a6a360bb52f3eb20a56f8d5150887c3fd3580fd12253"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/usegeekthing/ugt/releases/download/v0.3.2/ugt-linux-arm64"
      sha256 "016439e9588d1dd31f075e29504ae761b6d26b278a5641afb5c4601e0b8a6e62"
    end
    on_intel do
      url "https://github.com/usegeekthing/ugt/releases/download/v0.3.2/ugt-linux-amd64"
      sha256 "edb413199f9c1800a4c2458ec559bba6f9429a74a739ad06c12c47130e4fa26f"
    end
  end

  def install
    bin.install Dir["ugt-*"].first => "ugt"
  end

  test do
    assert_match "ugt #{version}", shell_output("#{bin}/ugt version")
  end
end
