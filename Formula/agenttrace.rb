class Agenttrace < Formula
  desc "TUI observability for AI coding-agent session history, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.9.1/agenttrace-darwin-arm64"
      sha256 "5ff6436f84c1a394af43acd483b949e7ec7785c38d9742bf4d3ad0ecf6fc8b2a"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.9.1/agenttrace-darwin-amd64"
      sha256 "071f0ed0bde567518f52016d95020c0f8fb2db19fba662b66b520834f92e8614"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.9.1/agenttrace-linux-arm64"
      sha256 "b1081eb7e68daf8f52df3a1113c6ee7cf31714584089706a1bb5a745b3bc4824"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.9.1/agenttrace-linux-amd64"
      sha256 "82f12f9f8da12ecc3e402a270bd0d4a4773d483b4d6e87642d63bdf6f24c2a40"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.9.1", shell_output("\#{bin}/agenttrace --version")
  end
end
