# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.47/agenttrace-darwin-arm64"
      sha256 "e3127dff26f33c66123a3996e071ff494e58c0a94812fb1f87079e4e01f8fbaa"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.47/agenttrace-darwin-amd64"
      sha256 "1ab5b5d7b625568859df1816999cd38d0ab7ec995fc3663b34683e4d9534c1f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.47/agenttrace-linux-arm64"
      sha256 "cbd2e00b6eae53cc40491ebac02910b2a2e4c4323832d3875f45ea87296197c0"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.47/agenttrace-linux-amd64"
      sha256 "8d5b593a53597b834eb67a504cf86988da128a4b5c1f1d9a86935178729a7935"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.47", shell_output("#{bin}/agenttrace --version")
  end
end
