# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.3/agenttrace-darwin-arm64"
      sha256 "132d0f2e5b9b64e60713e958a0e0e7967681dfa573edb04ce5c1a6c6d5aba2d4"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.3/agenttrace-darwin-amd64"
      sha256 "8b6ce6fe489c5d53779473e03c2626458654d2f78991eea175fce42ce855b5fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.3/agenttrace-linux-arm64"
      sha256 "0a27595c16967391751a93e705e3fffdf312e109b8cc189842858ffb9eaf5fce"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.3/agenttrace-linux-amd64"
      sha256 "9040ad5f068d0b7a98f9741951c8c9dcd7cdf8d5b4d31f5c9b1d13a92c2d93c3"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.3", shell_output("#{bin}/agenttrace --version")
  end
end
