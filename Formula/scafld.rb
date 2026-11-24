class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://auscaster.com/scafld"
  version "2.5.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/auscaster/scafld/releases/download/v2.5.11/scafld_2.5.11_darwin_arm64"
      sha256 "9d22305cd1a6c237b72067e5d895f7bbfae8d6010dc05d735f39e923cc99e39e"
    else
      url "https://github.com/auscaster/scafld/releases/download/v2.5.11/scafld_2.5.11_darwin_amd64"
      sha256 "1eac41f94ca1ef1069df7d2c849fe5d6e2410eab157bc2335315dd7795ff3db1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/auscaster/scafld/releases/download/v2.5.11/scafld_2.5.11_linux_arm64"
      sha256 "092871562bd8029badcc3c528cd4b1cddcc03b4ce53fb229b5756354ced0b571"
    else
      url "https://github.com/auscaster/scafld/releases/download/v2.5.11/scafld_2.5.11_linux_amd64"
      sha256 "e9cbf819500fd3ea858befa0d210efe323ce0a1a15abf5f344e42cf1b1493fb8"
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
