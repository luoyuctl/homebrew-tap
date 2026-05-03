# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.39/agenttrace-darwin-arm64"
      sha256 "2e93249cc2a25938f665e32ce62c9987e776543bdbb6fde7b0ff9059c4590dcb"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.39/agenttrace-darwin-amd64"
      sha256 "d4647659e045a7e12ec7351ed5873402fb2dadf8ee645c474ccb70864867d4c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.39/agenttrace-linux-arm64"
      sha256 "3994c38391f5c5aa02a29f5ebcbe4cab67a94cbed9a60ebe35ee6877d32c3704"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.39/agenttrace-linux-amd64"
      sha256 "aabda27578034e123ca3d2267f13100fee739442f49f9434b65f793b7231ab3a"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.39", shell_output("#{bin}/agenttrace --version")
  end
end
