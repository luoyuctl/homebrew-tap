# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.46/agenttrace-darwin-arm64"
      sha256 "ebe4de619404c17221d581371cb813cadfc1163f9417b7fafbd6f01bd8531947"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.46/agenttrace-darwin-amd64"
      sha256 "322fe6f06a772fe4c035ecdaf38169415b27fc9f0843863abd64bf2f39a9f8df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.46/agenttrace-linux-arm64"
      sha256 "9f041558496f624f63bdd6e906b63d55fc2dfde7a917dd8e734990cbdc2ab231"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.46/agenttrace-linux-amd64"
      sha256 "b566d54219d6c3ed36d0af0655a6fc08b5a04b61de44edc1b6c37c68276732e1"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.46", shell_output("#{bin}/agenttrace --version")
  end
end
