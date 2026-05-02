# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.10/agenttrace-darwin-arm64"
      sha256 "8fa70d199264389a1ce4487decfc022bba7ad2e17bbaa77c4b05ad6b449eaf72"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.10/agenttrace-darwin-amd64"
      sha256 "5494ae22efd6dac12e620dc267cfa56915bbb7a679976273018246eae146f163"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.10/agenttrace-linux-arm64"
      sha256 "54b923047c1780c7b61e566ef137603d4ef0bc078c0f81254506d39256b20c94"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.10/agenttrace-linux-amd64"
      sha256 "ff4e59ce6658d32de6c53cac44734acfb09ffe5aba12bf2a7c72681e478aa874"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.10", shell_output("#{bin}/agenttrace --version")
  end
end
