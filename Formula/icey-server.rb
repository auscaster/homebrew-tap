class IceyServer < Formula
  desc "Self-hosted source-to-browser server built on icey"
  homepage "https://auscaster.com/icey/"
  url "https://github.com/auscaster/icey-server/releases/download/v0.2.5/icey-server-0.2.5-source.tar.gz"
  sha256 "861c1c267b539c66a84f63f1c3e322c77188b2fa0c41e189bd0d4b8aca034d6f"
  license "AGPL-3.0-or-later"

  depends_on "cmake" => :build
  depends_on "node" => :build
  depends_on "pkgconf" => :build
  depends_on "ffmpeg"
  depends_on "openssl@3"

  resource "icey" do
    url "https://github.com/auscaster/icey-server/releases/download/v0.2.5/icey-2.5.1-source.tar.gz"
    sha256 "36f15c43b5720c51fa0af450b0e495f851b5872359d8bc3b80188f65c6382e5a"
  end

  def install
    resource("icey").stage buildpath/"icey"

    system "npm", "--prefix", "web", "ci"
    system "npm", "--prefix", "web", "run", "build"
    system "cmake", "-S", ".", "-B", "build",
      "-DCMAKE_BUILD_TYPE=Release",
      "-DICEY_SOURCE_DIR=#{buildpath}/icey"
    system "cmake", "--build", "build", "-j1", "--target", "icey-server"
    system "cmake", "--install", "build", "--prefix", prefix, "--component", "apps"
  end

  test do
    assert_match "icey-server", shell_output("#{bin}/icey-server --version")
  end
end
