class Ugt < Formula
  desc "Get open-source GitHub projects running on your computer, with your AI app"
  homepage "https://usegeekthing.com"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/usegeekthing/ugt/releases/download/v0.3.3/ugt-darwin-arm64"
      sha256 "d1326d290014a607d060c3b623bada51ee35119cb74fc423e06049c5e8c8ddea"
    end
    on_intel do
      url "https://github.com/usegeekthing/ugt/releases/download/v0.3.3/ugt-darwin-amd64"
      sha256 "9b14ae767b2972a05d71be21ace9c6ffcafacbc93f9fe00da29b0b66d8c54f7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/usegeekthing/ugt/releases/download/v0.3.3/ugt-linux-arm64"
      sha256 "c85516b314114307742a59319f553d3bc31f7fe3341a4ef3e23389dadaa4f4b7"
    end
    on_intel do
      url "https://github.com/usegeekthing/ugt/releases/download/v0.3.3/ugt-linux-amd64"
      sha256 "a4391e5d7ced8a274790b36f1c40b99016daa41f1595bf7bc50e813d2a82af82"
    end
  end

  def install
    bin.install Dir["ugt-*"].first => "ugt"
  end

  test do
    assert_match "ugt #{version}", shell_output("#{bin}/ugt version")
  end
end
