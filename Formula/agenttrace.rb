# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.6/agenttrace-darwin-arm64"
      sha256 "2d0afbec32dfd09523e92263d87a7858b3f17f540b8734cc7697aab186b8602c"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.6/agenttrace-darwin-amd64"
      sha256 "0c3b66ab539d8753a631ee406bf5095b33b27af582d58e0dc4e246defdf60eb6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.6/agenttrace-linux-arm64"
      sha256 "19dbb3686f77a5ad49ec15b9dabdd71ff686c2aa963335c07b725ddfe4d11318"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.6/agenttrace-linux-amd64"
      sha256 "5b31a2d5b8379d2c0cdecfdeffab96bdae06331531eadf0d2b0800c00008aeb4"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.6", shell_output("#{bin}/agenttrace --version")
  end
end
