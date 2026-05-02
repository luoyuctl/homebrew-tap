# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.37/agenttrace-darwin-arm64"
      sha256 "13ed9196e181aad760df12cc8b70e037ab40891e0dbbbbaab70be54245ac5dbd"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.37/agenttrace-darwin-amd64"
      sha256 "1bc161e9082875d26cc254e40ce127e486aa1fcd1a8feb15125c1892ebde15de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.37/agenttrace-linux-arm64"
      sha256 "bc0b59f083f6e398ff371313ccc61b74d562679cf7cc0f7a8326198ecc049fa7"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.37/agenttrace-linux-amd64"
      sha256 "b43bc51c6a93569c98cd1c57cf2fae4ab8e7840d7e9638351dbbb4c091b31cf8"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.37", shell_output("#{bin}/agenttrace --version")
  end
end
