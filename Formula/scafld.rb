class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://auscaster.com/scafld"
  version "2.5.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/auscaster/scafld/releases/download/v2.5.10/scafld_2.5.10_darwin_arm64"
      sha256 "347609257f1a65431b9f06e14927c11f8037a0a59dd23fe9ea26b602d44e1096"
    else
      url "https://github.com/auscaster/scafld/releases/download/v2.5.10/scafld_2.5.10_darwin_amd64"
      sha256 "411e7e6499f76d78e072c6884badf1e0993c80677db9479af5a92fbefdf8a01a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/auscaster/scafld/releases/download/v2.5.10/scafld_2.5.10_linux_arm64"
      sha256 "b7993ae4816c15c5f1a2d997553563456b22e84152ddc369d48a52aa010f999a"
    else
      url "https://github.com/auscaster/scafld/releases/download/v2.5.10/scafld_2.5.10_linux_amd64"
      sha256 "47402e068cc8b3ebb0b91ac6381702e8c4a703d070601c8a3ea600272b938df9"
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
