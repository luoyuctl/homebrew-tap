class Agenttrace < Formula
  desc "TUI observability for AI coding-agent session history, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.9.0/agenttrace-darwin-arm64"
      sha256 "f29fe44bb5039f5441d79fe53c6893788685914f48910083c88ed7337141c2b3"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.9.0/agenttrace-darwin-amd64"
      sha256 "af84d9fe5770f2fc93c8125491e87ecea7fb93c7188c668347445341fa6f5a66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.9.0/agenttrace-linux-arm64"
      sha256 "253bd6c5e2f659477f057ff4ff28728823259eac9cf3e14328d75ba936f6f40f"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.9.0/agenttrace-linux-amd64"
      sha256 "ff26324f2114e1757babbbb9d7d0729f80d58073224dd20729c893e6d70a7ad8"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.9.0", shell_output("\#{bin}/agenttrace --version")
  end
end
