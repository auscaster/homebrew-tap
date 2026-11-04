class Ugt < Formula
  desc "Get open-source GitHub projects running on your computer, with your AI app"
  homepage "https://usegithubthing.com"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/auscaster/ugt/releases/download/v0.2.2/ugt-darwin-arm64"
      sha256 "ff5fb73f0ac62365dc70a4da4f5023c3de340ede0ee9a467a47bbe15d490abce"
    end
    on_intel do
      url "https://github.com/auscaster/ugt/releases/download/v0.2.2/ugt-darwin-amd64"
      sha256 "e133340fea536674647c9f01ffa1ae0bcf30fb845f178053029bbe2b31e29687"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/auscaster/ugt/releases/download/v0.2.2/ugt-linux-arm64"
      sha256 "aa6a7b15259880c3dda81a6b827256667d74c1ef7fe972238392ec753a5ed661"
    end
    on_intel do
      url "https://github.com/auscaster/ugt/releases/download/v0.2.2/ugt-linux-amd64"
      sha256 "d1fece69b8f213decf6342648ffa0b90fd945bceafcd5f9cdd90929d8aa1aef6"
    end
  end

  def install
    bin.install Dir["ugt-*"].first => "ugt"
  end

  test do
    assert_match "ugt #{version}", shell_output("#{bin}/ugt version")
  end
end
