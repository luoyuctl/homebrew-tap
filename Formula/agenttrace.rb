# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.28/agenttrace-darwin-arm64"
      sha256 "1d745b2799fccf57809a09d34002456600a30267f55da6928b22c2e080aabb25"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.28/agenttrace-darwin-amd64"
      sha256 "77f07fbe0b9b78b3510418b63b5d8850266ab1655f14e081b00538d5f7603b0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.28/agenttrace-linux-arm64"
      sha256 "77443e91178345e376f41052c62303d55a5ef7b0311a0f642c8787f86cc27b5a"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.28/agenttrace-linux-amd64"
      sha256 "67ce3c3897d910aca1d3300145e15662ebd35f2f4dcd6ae2a48b39cf5add925a"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.28", shell_output("#{bin}/agenttrace --version")
  end
end
