class Agenttrace < Formula
  desc "TUI observability for AI coding-agent session history, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.8.1/agenttrace-darwin-arm64"
      sha256 "0d09ed6a6ee5710fdfa2817b65f495aae3bfe5e4f81de0db6b8f6eaf2b638f47"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.8.1/agenttrace-darwin-amd64"
      sha256 "b6a3cbd22454222a1fca06006867f325ee44a381e489e716b0ba52a42a161dcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.8.1/agenttrace-linux-arm64"
      sha256 "30648d4dcc8ea77f0825505bde56ace5774acf81204ca43a7a9c3a68df564b0f"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.8.1/agenttrace-linux-amd64"
      sha256 "e44f520b3641b2c63aae2f3a48b43e3beef2e408c18387d76aa686c9815aab76"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.8.1", shell_output("\#{bin}/agenttrace --version")
  end
end
