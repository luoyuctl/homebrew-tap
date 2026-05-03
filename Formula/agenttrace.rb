# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.44/agenttrace-darwin-arm64"
      sha256 "46e1ab40f2d3a7e0453385d00af219160fbff2c3bae93b8d66950a5d50216236"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.44/agenttrace-darwin-amd64"
      sha256 "b998208ed536da5ef5d9537227dc621627799dc8922fe8d2086e57f2df51b525"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.44/agenttrace-linux-arm64"
      sha256 "4d658c4d5d274ffee5aac1a31601df33a635a25fbe0dcc2a8f06c3ae7e9cd571"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.44/agenttrace-linux-amd64"
      sha256 "b528f7116b3e1255ed1fae3c815fd4e481bd4dc97ad4827bafe8ac54e9debf53"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.44", shell_output("#{bin}/agenttrace --version")
  end
end
