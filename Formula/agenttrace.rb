# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.16/agenttrace-darwin-arm64"
      sha256 "39f78cfac8982f04caf900daed3b7349667fe50a600e055c4206d1cbcd6b1ea3"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.16/agenttrace-darwin-amd64"
      sha256 "dadf74c73378733a8cce2dfe89acd84588f538e5470b7bc940d2dc5ab4b590bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.16/agenttrace-linux-arm64"
      sha256 "b7a3c4f7d9c9298882616750fc9c99faadc02c28fb9465ebde16290cecd6284d"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.16/agenttrace-linux-amd64"
      sha256 "b2f44ac0c9c82a26cbdce028b5ff12236062d151b7c55023e31f0cee4f08e5fe"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.16", shell_output("#{bin}/agenttrace --version")
  end
end
