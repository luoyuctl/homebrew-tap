# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.4/agenttrace-darwin-arm64"
      sha256 "279653846db684953eeb15ce66c8e0d814af1b6e86fdbebb12ee9a203b8a70ec"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.4/agenttrace-darwin-amd64"
      sha256 "7540d3e004fe19851231505344f6f8990d5320a2c68e73c52bec128369d835cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.4/agenttrace-linux-arm64"
      sha256 "52511b643ae9bdad265927806f1db955601202666bfa2f89d3a507b40719313c"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.4/agenttrace-linux-amd64"
      sha256 "69d3fc0ffd643f12e9765113eeea25e9d47a85aed9ac7fea913e85b454c3eec2"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.4.4", shell_output("#{bin}/agenttrace --version")
  end
end
