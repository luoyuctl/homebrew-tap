class Agenttrace < Formula
  desc "TUI observability for AI coding-agent session history, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.10.1/agenttrace-darwin-arm64"
      sha256 "6f4657beb6dfe6978e5c13351ff9e31fbc7e174e00ee961949864b2d3832da85"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.10.1/agenttrace-darwin-amd64"
      sha256 "fbee6c51aa0f022ad1cfc430fc9259a589e82d9505351bd1a22ee5971102b207"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.10.1/agenttrace-linux-arm64"
      sha256 "e111e5b0a0bde25572b5f2cf335aca1b4bceffc845acdca1f638186a24b6cc41"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.10.1/agenttrace-linux-amd64"
      sha256 "3f0159f2eca56717cc5e76a317e495b464fbdc5c9f2610665ef574c6a6d311b6"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.10.1", shell_output("\#{bin}/agenttrace --version")
  end
end
