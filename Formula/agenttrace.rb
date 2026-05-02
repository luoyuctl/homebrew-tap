# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.25/agenttrace-darwin-arm64"
      sha256 "43195ea179123c47d8e3ea708e9a70aad9fd82af92ebebb48f6d280f7864104c"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.25/agenttrace-darwin-amd64"
      sha256 "491a201b318ad4b285850f166c72c6273fa20fbeb4a1e906afbd99e9b4a9df4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.25/agenttrace-linux-arm64"
      sha256 "f953411cb55047f47e5ee164b0e2836a60144c1fc6c7c9a8dd4151f8b8cba144"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.25/agenttrace-linux-amd64"
      sha256 "707c537788f536e4dd31805a92806cfc59404a5384769ffc53b4231e0ccb8d01"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.25", shell_output("#{bin}/agenttrace --version")
  end
end
