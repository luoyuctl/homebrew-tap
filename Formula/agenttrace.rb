# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.45/agenttrace-darwin-arm64"
      sha256 "ba64424e0b7abf7b65fc57317829f40f82dd87c3aa584c3cec91a716e2ffc1cf"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.45/agenttrace-darwin-amd64"
      sha256 "5090752462af2adbe4a8f3426cc707b6913b9c5a07343413181d275d0efff891"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.45/agenttrace-linux-arm64"
      sha256 "13f837beac13454992fdf9badb65472d0f758c08e4b51575959000a2285b4dcb"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.45/agenttrace-linux-amd64"
      sha256 "96daf17ab505b7517d072de0c3a7536e52f09219cb8c6c7eb4c05202c951cf72"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.45", shell_output("#{bin}/agenttrace --version")
  end
end
