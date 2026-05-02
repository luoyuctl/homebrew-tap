# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.36/agenttrace-darwin-arm64"
      sha256 "dde6ac6f59400e9260d3aa1347b225f17f423d207546753b45abe5c3ce80b2d0"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.36/agenttrace-darwin-amd64"
      sha256 "e5b6cf3091bb4cccbc76a46b1fdf870d7dbedcc21b2931fd16d46fc19a08febd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.36/agenttrace-linux-arm64"
      sha256 "11938c94934ff41b2b5ed58ba80e653b4583ac84169b3de866034941a510ffdc"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.36/agenttrace-linux-amd64"
      sha256 "769b35b9315a4304434c86e04dc986d7214a225179dc38336a5774e4d0c0b87d"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.36", shell_output("#{bin}/agenttrace --version")
  end
end
