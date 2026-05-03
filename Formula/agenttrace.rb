# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.40/agenttrace-darwin-arm64"
      sha256 "ffb5bf0930008df5529ba1fad7ae3579e341083e802c2bb91a21a21ae899a24c"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.40/agenttrace-darwin-amd64"
      sha256 "d018f353ed5b112e1dd0bfb5b3344b3b9462494f603c7ed1e272f2bd42e902fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.40/agenttrace-linux-arm64"
      sha256 "086a2a57176d030fea1cdeec94edd4656c907b94b163af18be9d33d9f04f7b0d"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.40/agenttrace-linux-amd64"
      sha256 "b96217d7ac9c3d6995feb4a74ff81e04dfc26573e9b4e434fb55bd398c36ec34"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.40", shell_output("#{bin}/agenttrace --version")
  end
end
