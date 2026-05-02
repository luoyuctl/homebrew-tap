# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.9/agenttrace-darwin-arm64"
      sha256 "8300a4acced84f08ebef7d91639ba772282aa03656b44a4c5f80d01d552b4d41"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.9/agenttrace-darwin-amd64"
      sha256 "1c818e231c71ecbdf529ed8cd9700e57307364a72be8c091665e4f57fc350341"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.9/agenttrace-linux-arm64"
      sha256 "4251624b9bc671e40f87c1db1ebd823d6c9a5032fd3184447d44eee0bc143db3"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.9/agenttrace-linux-amd64"
      sha256 "94913e465f231bf70762062854556dee5501eda4560d86e0cfe32d9bc2a57b68"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.9", shell_output("#{bin}/agenttrace --version")
  end
end
