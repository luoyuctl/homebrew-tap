# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.0/agenttrace-darwin-arm64"
      sha256 "b2d0ac603dc4ed5a059e9f64ae6b605c718c7ef23993b596447c33de28f39c06"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.0/agenttrace-darwin-amd64"
      sha256 "80c93986f10ed7b2f17540b65bdcf13519cd48c13cd05c59aa202d29df6d8714"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.0/agenttrace-linux-arm64"
      sha256 "85d36c0477e09510ad6b4a240b769992d2a22bee0ec8a99f48e15a4625328aef"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.0/agenttrace-linux-amd64"
      sha256 "e6835f912f7ba40f37e172f53a0e6bb2d7b68ee4c06e07f8ef464370366ed803"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.4.0", shell_output("#{bin}/agenttrace --version")
  end
end
