class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.5.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.9/scafld_2.5.9_darwin_arm64"
      sha256 "9832642430480d92456d91215e3580144919844d50fbe3c1d50990e7ac212763"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.9/scafld_2.5.9_darwin_amd64"
      sha256 "ebe772006dab162a1c1c6a3527bca8e4a5bdcc9cb7f71a5776db5aa77f614142"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.9/scafld_2.5.9_linux_arm64"
      sha256 "b3cdf6b1882bcd3c6dbedf059ac9699c86064ad2a127af5a61f8b4b0e07b26d5"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.9/scafld_2.5.9_linux_amd64"
      sha256 "1dcbdc0b6856181f599c666169c2e09e80e031906ebfb353122d6cf816ac96aa"
    end
  end

  def install
    bin.install Dir["scafld_*"].first => "scafld"
    chmod 0755, bin/"scafld"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scafld --version")
  end
end
