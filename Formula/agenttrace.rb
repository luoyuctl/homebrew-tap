# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.19/agenttrace-darwin-arm64"
      sha256 "aa2f5694e203d27095725976a833aec5fbc23beaec12c9ea58efae0af744cd5b"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.19/agenttrace-darwin-amd64"
      sha256 "d01e9a1296411d3bf9de89c6a9ff5c5946964961337840fd279459e8cdaa1f6b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.19/agenttrace-linux-arm64"
      sha256 "7cdae4f702dc25852c2600d44cfc9f5fcf06c239c38e703da3af22b045aa5772"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.19/agenttrace-linux-amd64"
      sha256 "a4f6eb24ab005afbe4992b94023794ed7ca477866745c19c516b37c281701a2b"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.19", shell_output("#{bin}/agenttrace --version")
  end
end
