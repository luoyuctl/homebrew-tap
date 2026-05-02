# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.5/agenttrace-darwin-arm64"
      sha256 "f20e957f6c26918d80781829a5b26d427233dd4d8bc3b0ed83086e8068e1a347"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.5/agenttrace-darwin-amd64"
      sha256 "b5288e23909d32336977705d65de8b8bb990049098c822f6cc7da50490b344ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.5/agenttrace-linux-arm64"
      sha256 "563d3212cf2e5375bf2b93befa6d17e39cc663fd8212a9c10675604ab143d064"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.5/agenttrace-linux-amd64"
      sha256 "c61aed081d39a7b08a708da3631f68e6e837caec627eb7813cbfa52a257aaa5b"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.5", shell_output("#{bin}/agenttrace --version")
  end
end
