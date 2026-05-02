# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.21/agenttrace-darwin-arm64"
      sha256 "defc6e0f89368210202984044432b144538a358d6fabcdf2527b9bb60736c829"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.21/agenttrace-darwin-amd64"
      sha256 "9951141594a46e3ba1f39d8308e05bc13c85c9c5d4adca5da7509246f0273b66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.21/agenttrace-linux-arm64"
      sha256 "b00d51afa243b3f44564d2f178a7dfbbbca0bb783b7767db4f27a6d08c8af03a"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.21/agenttrace-linux-amd64"
      sha256 "e67aa1512120f5cc568ab79b16bbe32279a6e95556e349fb3a91dba0c0e593bc"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.21", shell_output("#{bin}/agenttrace --version")
  end
end
