# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.35/agenttrace-darwin-arm64"
      sha256 "3204972dfa0ac32f0491c6eb910ef94d04f1e65375c9b584b865d104ef80c5a9"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.35/agenttrace-darwin-amd64"
      sha256 "5d097d84c86e10b8e7d04bee0d9a838bd147dc6de87817204bcf96008d0b2678"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.35/agenttrace-linux-arm64"
      sha256 "a72f7ef37d91f09bacd54a71a0b018ffc3ad95c1b388ddc66ac1a1e2baf3d85b"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.35/agenttrace-linux-amd64"
      sha256 "e4f846e89a1635c5478adc43cc6bf0e191bd4dc82a9f9c4d5edf57353ae53ef7"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.35", shell_output("#{bin}/agenttrace --version")
  end
end
