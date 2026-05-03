# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.41/agenttrace-darwin-arm64"
      sha256 "1960fda0d1d98d43b5e903ce43ceddc9dbaa164fd944b77ea2705288e154fc99"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.41/agenttrace-darwin-amd64"
      sha256 "870ae4d5799e6009d5df90de9c774f6f128108a806b8e0d5c85f9de0474cefc7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.41/agenttrace-linux-arm64"
      sha256 "0ca0c5744ba896f5bfd5ba996b7e2b6eb0382757cb68c58e9de9b3769416161b"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.41/agenttrace-linux-amd64"
      sha256 "bba4e8ff6513e37aa93de20afdc04317fb906e739a1381f182cf1a57308c9e3e"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.41", shell_output("#{bin}/agenttrace --version")
  end
end
