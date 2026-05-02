# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.29/agenttrace-darwin-arm64"
      sha256 "3c592773f004db99e64ef7f39e3a6e3ed35abdf8bb17a3782a9aac52b5b6cf2b"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.29/agenttrace-darwin-amd64"
      sha256 "0bca58a4bf869984645b4edca90ee19c5632082a54c3350a8febb1cee6cf0c03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.29/agenttrace-linux-arm64"
      sha256 "0130f72563f2893dd936e3b038990e3b61dd42b814e51ec78f2e71342692d239"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.29/agenttrace-linux-amd64"
      sha256 "1ab1a0f2b8279471ded995b6fac420c27d08283e79744303b0471a0c5a671a6a"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.29", shell_output("#{bin}/agenttrace --version")
  end
end
