# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.31/agenttrace-darwin-arm64"
      sha256 "308d9557685b2376515cc933e8b9a4dd2371cde7b8cd5269d1650c750d23357a"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.31/agenttrace-darwin-amd64"
      sha256 "73626b052f654a45310e29f99e56491586457fce992986c1568ac69d5d24d88d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.31/agenttrace-linux-arm64"
      sha256 "4f4d49ac32ac34fc33871fabb64497dde7f433e8a8e6d9806d244208930dc6ff"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.31/agenttrace-linux-amd64"
      sha256 "5bf844a0afe458f228d862cc7a0d5c3e80fa517d8cef02536fe0d2f09802be49"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.31", shell_output("#{bin}/agenttrace --version")
  end
end
