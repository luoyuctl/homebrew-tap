# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.22/agenttrace-darwin-arm64"
      sha256 "0ad564a84b8d4c027aa205dc0065cc331c1241663777acf112464b02597796f3"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.22/agenttrace-darwin-amd64"
      sha256 "c286a6929b0cff4e225e4791fe26788459eb0f8821c7364e5b970042bd302abe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.22/agenttrace-linux-arm64"
      sha256 "c2d029c8e30ca50983f04407db679a1d88b33d272f46ec2a95c7143f5eed33e6"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.22/agenttrace-linux-amd64"
      sha256 "46fd978c46e17118d41e585e2e7a94c60d8d174d27f2fa904b578020d92914fb"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.22", shell_output("#{bin}/agenttrace --version")
  end
end
