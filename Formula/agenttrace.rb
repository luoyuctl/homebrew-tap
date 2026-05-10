# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.4.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.6/agenttrace-darwin-arm64"
      sha256 "70a001d17762ebd3c29863b30da89f894db37e56840d4c93200fb720d4b65e63"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.6/agenttrace-darwin-amd64"
      sha256 "2306efdb235ab1d9cf6285dead68cb636a7979c22b264572f03489ac05ee3ac5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.6/agenttrace-linux-arm64"
      sha256 "7fb146d28964cdde3eb5951902b911c32e0cbf8af5a4cc95c365ece709680f7f"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.6/agenttrace-linux-amd64"
      sha256 "a3ab18c17ad2cd355fd1509b4077092f7d5182e11376294011d59d49760f4371"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.4.6", shell_output("#{bin}/agenttrace --version")
  end
end
