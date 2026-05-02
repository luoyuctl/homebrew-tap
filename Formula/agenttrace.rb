# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.7/agenttrace-darwin-arm64"
      sha256 "6f81e2450590d3588150b9c129dcfb94733bb77b3b48d2183128de2559f25999"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.7/agenttrace-darwin-amd64"
      sha256 "65d22879425d60b7ac6449f56bf9e7ae15bd1b637058ecc0f543e659e0f6e9f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.7/agenttrace-linux-arm64"
      sha256 "24a7ad72dcfb3d842d609a1173868f82b07b618e52da92cb80f6f5c57635f1e2"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.7/agenttrace-linux-amd64"
      sha256 "07da81f6b424ff0d160d8956d392a0b0d7000901049f43b9913ce0df746a0717"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.7", shell_output("#{bin}/agenttrace --version")
  end
end
