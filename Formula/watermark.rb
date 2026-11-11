class Watermark < Formula
  desc "Command-line client for the Watermark image, video and PDF API"
  homepage "https://api.watermark.ws/docs/cli"
  url "https://registry.npmjs.org/@watermarkws/cli/-/cli-0.1.4.tgz"
  sha256 "591d807acdc67919d54eb67085eca2ad587076c0c21ed36e0e051d37cbcf611a"
  license "MIT"

  bottle do
    root_url "https://github.com/watermarkws/homebrew-tap/releases/download/watermark-0.1.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "da1bb36ee3b22bec8f5e7ead801d4b2851675f7e2f1e04caba32e355a0b5db53"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0693deea9c55fdf77aab3034ffaac0c581ac91391e455f843ceb7c1e62a0157a"
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
