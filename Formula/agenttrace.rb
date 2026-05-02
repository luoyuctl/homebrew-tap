# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.34/agenttrace-darwin-arm64"
      sha256 "a21073a129ecb048fba968e68266b1c922993fd24a3aa4be7a351345e2298547"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.34/agenttrace-darwin-amd64"
      sha256 "2562739bd3de4e9dddc07a9146c576121aae16f667b5167570f4c4f8fe0adf21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.34/agenttrace-linux-arm64"
      sha256 "244d75c780cc20a4520c023e47cab347d2c604db4cd116a07113bdce0f055e48"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.34/agenttrace-linux-amd64"
      sha256 "84738e4f6d4933eae462df131bc34cb38ffe81ef2b5d456a47d889849c0e9b80"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.34", shell_output("#{bin}/agenttrace --version")
  end
end
