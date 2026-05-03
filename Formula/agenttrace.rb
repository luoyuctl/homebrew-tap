# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.38/agenttrace-darwin-arm64"
      sha256 "677fe2a85c866ddc87c2fc0d19356f40c09c2233a20f18e474b3e5886cabc87b"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.38/agenttrace-darwin-amd64"
      sha256 "5a3cbf8efba3783fa0f64a2e8ce91987629949b663986f7cc26307d2d5412d08"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.38/agenttrace-linux-arm64"
      sha256 "83dc3002b5dde685a093110f140b2e2db9d46480a2f542f7c638726f463db678"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.38/agenttrace-linux-amd64"
      sha256 "4316d536d889fbc6c911412df3bcbbbc9bb38f906c8bbbd0015e0352bc34abc9"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.38", shell_output("#{bin}/agenttrace --version")
  end
end
