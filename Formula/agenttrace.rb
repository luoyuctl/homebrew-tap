# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.26/agenttrace-darwin-arm64"
      sha256 "ac78056cdc8d5532a7b1cb75e11a1c47369ba038d75afe759d88c70643d58479"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.26/agenttrace-darwin-amd64"
      sha256 "20adde41d1aec7512090af2228384e12dab1fb18df635452cf97a9071d47565f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.26/agenttrace-linux-arm64"
      sha256 "4055a96eae067eb739528929aeac8e8e62135b8d364149c36f23b38b60dd9c0f"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.26/agenttrace-linux-amd64"
      sha256 "60721510e065cf3188f518c3b3f965d075d260f88c04af85c6539814e496bd48"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.26", shell_output("#{bin}/agenttrace --version")
  end
end
