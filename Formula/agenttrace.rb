# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.2/agenttrace-darwin-arm64"
      sha256 "59f4db9aaa72843f5c3cc16f5c427ad61ad6d73cff683a201d569c14da3738f6"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.2/agenttrace-darwin-amd64"
      sha256 "5cce56feba412c33d87c24934d25699abc070b95b0285d02fa6a1729e00d07d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.2/agenttrace-linux-arm64"
      sha256 "a29a4aeac0b7768800da65df908bc69bf929a802663d6fd4e49b272a8285fa5d"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.2/agenttrace-linux-amd64"
      sha256 "f01e340ad8b3e8d71f2628dd7e85086a2bb6214366238441bb446779963dbae1"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.2", shell_output("#{bin}/agenttrace --version")
  end
end
