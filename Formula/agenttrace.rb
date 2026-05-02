# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.15/agenttrace-darwin-arm64"
      sha256 "3317ccdb249d22bc2916d6e1cb41f9a5866a6471ae1977fdf351b5bcf218145f"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.15/agenttrace-darwin-amd64"
      sha256 "01bc60de2c3dd24f0585a2caee31e3e4a075a3ca4adbc4bba12309b31e17e870"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.15/agenttrace-linux-arm64"
      sha256 "ace3478489787bffa7acf0b73838c1a0977b76a5fc00cd512ca593c79ed17e6b"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.15/agenttrace-linux-amd64"
      sha256 "2f0425feb6b616676fb326d83d2a0673b4320a9b89eeed654dbaa154b9a25f24"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.15", shell_output("#{bin}/agenttrace --version")
  end
end
