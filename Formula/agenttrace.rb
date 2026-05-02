# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.27/agenttrace-darwin-arm64"
      sha256 "68e5f271c5b9f3a046746b2ce80fe184de49ff4ce296afb9eeac65771b4ad987"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.27/agenttrace-darwin-amd64"
      sha256 "8071642dc325a1829176b122a0861ca698a9d07673c371e63ea8d251cb54512d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.27/agenttrace-linux-arm64"
      sha256 "cddbd2f991cfb99813f76ad1f7fdacee62c13dd731eed0219f997d8349317b72"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.27/agenttrace-linux-amd64"
      sha256 "7be49ecfa00696ce565069e0dc5a4c727daf7194e8e922eeabaf9729c137175f"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.27", shell_output("#{bin}/agenttrace --version")
  end
end
