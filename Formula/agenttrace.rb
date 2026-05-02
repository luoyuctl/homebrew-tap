# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.23/agenttrace-darwin-arm64"
      sha256 "d36fab3c932a5ee64e243de1ad89c6f9530b4fa508f56e7bd9a85c96d16783c1"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.23/agenttrace-darwin-amd64"
      sha256 "2a5104adb59642194e138807db47c92f28d6d05ec134100bf0a9e9265057e1ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.23/agenttrace-linux-arm64"
      sha256 "e86cfd23740471ac771c26fcf2baa7b4f700d0ccbca4314b1753e19720281b49"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.23/agenttrace-linux-amd64"
      sha256 "394c8a2cf56fee79d9d7a0f8f216432f24a1b82ef3116ec9f23bebdb8ae3134a"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.23", shell_output("#{bin}/agenttrace --version")
  end
end
