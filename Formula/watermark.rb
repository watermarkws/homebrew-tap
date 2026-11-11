class Watermark < Formula
  desc "Command-line client for the Watermark image, video and PDF API"
  homepage "https://api.watermark.ws/docs/cli"
  url "https://registry.npmjs.org/@watermarkws/cli/-/cli-0.1.4.tgz"
  sha256 "591d807acdc67919d54eb67085eca2ad587076c0c21ed36e0e051d37cbcf611a"
  license "MIT"

  bottle do
    root_url "https://github.com/watermarkws/homebrew-tap/releases/download/watermark-0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4164161889351e263e8ba0457d4522d039999c38f569030a67f0a40fbfac0207"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c40b47aa16ab93af5979bdd5b7a88db40fc31bc1f9811469590c872cc9541b5c"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    # Runs offline in Homebrew's CI: no key, no network.
    assert_match version.to_s, shell_output("#{bin}/watermark --version")
    output = shell_output("#{bin}/watermark account 2>&1", 1)
    assert_match "WATERMARK_API_KEY", output
  end
end
