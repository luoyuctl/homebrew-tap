# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.33/agenttrace-darwin-arm64"
      sha256 "a7c5f53e771242b531b1c27a0fbda488666184d9351a0d6e42a624d08e38877a"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.33/agenttrace-darwin-amd64"
      sha256 "91d1b04ac49a2a54af1395a9dadad8de911fcb0e3b6e13774e30c5e02e4b59d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.33/agenttrace-linux-arm64"
      sha256 "c8992693587bf5ad7d61b49791580fc221d0cb3fcbbb38bbd492b2022889108d"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.33/agenttrace-linux-amd64"
      sha256 "4a98df986129ac9d718f0ef4e30bfad1620da692d0d578dda4c0ac322cf555bd"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.33", shell_output("#{bin}/agenttrace --version")
  end
end
