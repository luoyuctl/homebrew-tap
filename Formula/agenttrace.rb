# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.20/agenttrace-darwin-arm64"
      sha256 "45119e33f878c3b1ed0f5080baef66d8d0ceb4a3645f205b22a7d6dccc0e8128"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.20/agenttrace-darwin-amd64"
      sha256 "0c7a54c2ba900e3a0b2e4293823b02b0597a13760464ba305386cafebff4c8ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.20/agenttrace-linux-arm64"
      sha256 "d324819f61f25bcbf2da2fbd65c13d2a2579eaa512c9689eb23031eba4422708"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.20/agenttrace-linux-amd64"
      sha256 "7ac66a1a82158e6a22e0b7bd6862bdd390c3f998b97b5de007cdd1e614e96555"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.20", shell_output("#{bin}/agenttrace --version")
  end
end
