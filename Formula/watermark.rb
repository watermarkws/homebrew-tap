class Watermark < Formula
  desc "Command-line client for the Watermark image, video and PDF API"
  homepage "https://api.watermark.ws/docs/cli"
  url "https://registry.npmjs.org/@watermarkws/cli/-/cli-0.1.1.tgz"
  sha256 "b5a81c554f099ddd7c798598944078cedf13be28b2c0c8769fa7ea0251db2fe2"
  license "MIT"

  bottle do
    root_url "https://github.com/watermarkws/homebrew-tap/releases/download/watermark-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "cd0fcc206d459a5b8ec2471a050db1bd785541a9ff4fbad3959cf2ad4de15588"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c679f2a3553b891b653013fc67beb77d4f8ab2c1b529fd9016f0e29916976cfb"
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
