# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.4/agenttrace-darwin-arm64"
      sha256 "cf2d0831b96e70b5c417c434f420e954e793a24040cbe825ecfca8283b0d1bf6"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.4/agenttrace-darwin-amd64"
      sha256 "4d2bfb27483c890845d6bdf897aa2ed92dbc83a5c95cecc9c02faa4f914cf820"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.4/agenttrace-linux-arm64"
      sha256 "402be051dff6637a3f9417fc0ab28974c0bcd7aa8d9a13864d7aa48aceaf15d6"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.4/agenttrace-linux-amd64"
      sha256 "f638137130194ff2bd126261b1acb124bc1a8e6fd89b96fccd7290e6c9e671ed"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.4", shell_output("#{bin}/agenttrace --version")
  end
end
