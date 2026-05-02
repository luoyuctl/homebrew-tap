# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.13/agenttrace-darwin-arm64"
      sha256 "8371f71a5a15adad5fc15ce2fadad9f89cde157e683497110c9e2425ba9a3496"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.13/agenttrace-darwin-amd64"
      sha256 "168e6f0c2cef76c0d766dc9f74719c23fa654617c5194a629db3fb420d78a2e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.13/agenttrace-linux-arm64"
      sha256 "f7ebf2548bfc9663dbf3f86e6d9411681635a38fa4dbd72dbc50c60c61481ec6"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.13/agenttrace-linux-amd64"
      sha256 "74a55c29f4de27da5b1822e68b4b4132597941611d3f7a3ce9ef7856c0e17f9e"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.13", shell_output("#{bin}/agenttrace --version")
  end
end
