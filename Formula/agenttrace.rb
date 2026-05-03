# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.48/agenttrace-darwin-arm64"
      sha256 "2796f0afcab4759bfb1dbf02a9105e11a8ae37b359188a87415c3ed6da8599c3"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.48/agenttrace-darwin-amd64"
      sha256 "aa30954ba374e440c52172cdbf071c2ba7e9d47f3c3b6436466586f597977516"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.48/agenttrace-linux-arm64"
      sha256 "0bd45231850ca2b002a25df7c00be8e6d1937cec8ccfe334bb31046cc5a05312"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.48/agenttrace-linux-amd64"
      sha256 "b467eb68fa43bf8d7fbc53c7fd55e0cd409e69443bde71338e8ecefe9c6be6f2"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.48", shell_output("#{bin}/agenttrace --version")
  end
end
