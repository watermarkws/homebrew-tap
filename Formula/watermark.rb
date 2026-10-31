class Watermark < Formula
  desc "Command-line client for the Watermark image, video and PDF API"
  homepage "https://api.watermark.ws/docs/cli"
  url "https://registry.npmjs.org/@watermarkws/cli/-/cli-0.1.2.tgz"
  sha256 "323dad3696627a21b088c5da624899362afa73a34481b515e540bc5e4ffb44a7"
  license "MIT"

  bottle do
    root_url "https://github.com/watermarkws/homebrew-tap/releases/download/watermark-0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ac7664b205f56ac8a7c5875f0ddb0ddcf580b194824f8a292c304eafb7c098b1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "adc5c0ad5765f465461c57bd47cbbdd345fef50111fc83f16ab2a32ddeb26a98"
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
