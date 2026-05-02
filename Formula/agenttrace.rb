# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.8/agenttrace-darwin-arm64"
      sha256 "407cfcd8f1efc189713aca04271dddabe11e6cb43ca3c1184d0b0ee94d40a46d"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.8/agenttrace-darwin-amd64"
      sha256 "961adce0060fb8b22710e9a9b50546a183699d53d415579169c98f22f4e6584d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.8/agenttrace-linux-arm64"
      sha256 "d09f2380aff6b647a70fc7facd330f373d0a1c590d4df39e0889c7f34d21d6a9"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.8/agenttrace-linux-amd64"
      sha256 "80bad4ab53e7cff354ac8e673e14c46d23c50b745723adf4f928d40551cc6d26"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.8", shell_output("#{bin}/agenttrace --version")
  end
end
