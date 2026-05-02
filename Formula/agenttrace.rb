# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.30/agenttrace-darwin-arm64"
      sha256 "5401c6463111070dbedf7d77547cc7b3b434918f908909ba419de7dc361033ca"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.30/agenttrace-darwin-amd64"
      sha256 "df596c810c490a9bc97bb4295bc87d86201e8efc4fdac9bd67227068ca302f73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.30/agenttrace-linux-arm64"
      sha256 "013bd314a58ea6c9fb1f56d977e8afad5d26a8248bf3f4cb48787d93666206e6"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.30/agenttrace-linux-amd64"
      sha256 "b327691d480e6ac0dc2d31d05088277782c5ce16dc0b8cd0ffd6b15c7c1fed09"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.30", shell_output("#{bin}/agenttrace --version")
  end
end
