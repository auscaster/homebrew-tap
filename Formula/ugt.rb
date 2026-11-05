class Ugt < Formula
  desc "Get open-source GitHub projects running on your computer, with your AI app"
  homepage "https://usegithubthing.com"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/auscaster/ugt/releases/download/v0.3.0/ugt-darwin-arm64"
      sha256 "0dabf1b7b7c464771e8bd41e2e14f45cf8b2eafd2fb19db8f35515b93fa4f4e7"
    end
    on_intel do
      url "https://github.com/auscaster/ugt/releases/download/v0.3.0/ugt-darwin-amd64"
      sha256 "167a9162f32e16e624ef04123d58bbca503921d05ce22b1c14567ebd96feb868"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/auscaster/ugt/releases/download/v0.3.0/ugt-linux-arm64"
      sha256 "66c6b237fa674797507229ff5d0a5f90e3cb801853095071d920cecccbde7c13"
    end
    on_intel do
      url "https://github.com/auscaster/ugt/releases/download/v0.3.0/ugt-linux-amd64"
      sha256 "bac32cf47dc8b1393772cc60d67200dc17b35a2250efda5a412cd4ad3dc02f71"
    end
  end

  def install
    bin.install Dir["ugt-*"].first => "ugt"
  end

  test do
    assert_match "ugt #{version}", shell_output("#{bin}/ugt version")
  end
end
