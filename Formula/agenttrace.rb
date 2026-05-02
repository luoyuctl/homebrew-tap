# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.32/agenttrace-darwin-arm64"
      sha256 "83a0655bd0f8d695b262a602ae7230e3a76981629c4c36e7746f2b00d1352de0"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.32/agenttrace-darwin-amd64"
      sha256 "0bdc30f65abf34d53ff63c5c46f45d7efab47092349523edb536b0f844d1d588"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.32/agenttrace-linux-arm64"
      sha256 "a0224f2a79d88d25dd856604eb7b15f716f8bbcc7c4ca10dddafca6453cf42c6"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.32/agenttrace-linux-amd64"
      sha256 "50e9081650e2c29fb905a2a824c48c8dd31042b96f44e75fd5a98d481c921583"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.32", shell_output("#{bin}/agenttrace --version")
  end
end
