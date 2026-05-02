# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.18/agenttrace-darwin-arm64"
      sha256 "a6e3431666d0e4cc4f6d4099d9fef956de63a89238fcc22326c720fec25cb2c6"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.18/agenttrace-darwin-amd64"
      sha256 "dd4c67c27470045751d29bda32678556006e55f834050ed037233f252ea7cb48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.18/agenttrace-linux-arm64"
      sha256 "856dee7e1bce3bda6506ba63dd2dee2799d1f84020805eaf4d2e740aec19698b"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.18/agenttrace-linux-amd64"
      sha256 "a31489e7f8d844ba21f7acf34c677db5b53470403affed35c491a728ffa17156"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.18", shell_output("#{bin}/agenttrace --version")
  end
end
