# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.4.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.5/agenttrace-darwin-arm64"
      sha256 "3b733c8e72c3fedc877a87a49b2f1b999338fd67b45857765b184d22225e0c2d"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.5/agenttrace-darwin-amd64"
      sha256 "1e65264514239ba31f55f2b5a4f5318666f91f2354a678fc264d770ceda62ecf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.5/agenttrace-linux-arm64"
      sha256 "8a26fc691f9510c44d205f469f064b700e5ead5733e42983de3e90d5ba35410c"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.5/agenttrace-linux-amd64"
      sha256 "d5eb2d0477f9db6539ea95de832ba8e202c7d792559cf4b4a40d679e34f30fa2"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.4.5", shell_output("#{bin}/agenttrace --version")
  end
end
