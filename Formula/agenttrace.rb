# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.24/agenttrace-darwin-arm64"
      sha256 "c42a95c780c2b60da3e008dd621513772f6fd04f3a98dc7869b5e06a1dfe5336"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.24/agenttrace-darwin-amd64"
      sha256 "bdc913b02300d076cd5d8866e67f3ad1f62dc6e71175abef3353f64b43c37cc2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.24/agenttrace-linux-arm64"
      sha256 "1ced429d1843c5d7577a87ffd19e8ef3e74b7a7fd8be33f8aa8a7f23647d585a"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.24/agenttrace-linux-amd64"
      sha256 "da43044e736900016a646c7c3ebb43673344407e853720be2af67c56f3c3cbb8"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.24", shell_output("#{bin}/agenttrace --version")
  end
end
