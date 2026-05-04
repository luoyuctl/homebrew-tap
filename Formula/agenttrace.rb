# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.2/agenttrace-darwin-arm64"
      sha256 "d0ef5e6a724e86a87beee2c5c99b84ee1010449b7e239c39aef0772629f346b6"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.2/agenttrace-darwin-amd64"
      sha256 "9bac78209cac765026b01aedaafdbcd9978cc4d827539181b5df89b9dbf17f96"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.2/agenttrace-linux-arm64"
      sha256 "cc134f3b148e0c783d03a5fd3b3f02cece563ce2d8b01f8bc9a2f844c5cc987a"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.4.2/agenttrace-linux-amd64"
      sha256 "fbb753ff67e358de97066d8ffd26578073961922335c032104e5e6ff47de1f5b"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.4.2", shell_output("#{bin}/agenttrace --version")
  end
end
