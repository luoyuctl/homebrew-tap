class Agenttrace < Formula
  desc "TUI observability for AI coding-agent session history, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.8.0/agenttrace-darwin-arm64"
      sha256 "364bc6d3689c2cbc2cf979b680fa91c269608a3032132b350753bf70a920b2fb"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.8.0/agenttrace-darwin-amd64"
      sha256 "fa47f5356456d41d5223e1272e1701ad7cd99fa446d579f347c4ea7677ece26e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.8.0/agenttrace-linux-arm64"
      sha256 "1343828e224ef7b5ec6a7bd718956b71851a718beef38c003f907603fe63fd0a"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.8.0/agenttrace-linux-amd64"
      sha256 "e6f9dd6a45eeb502faf5ca1be4d957d6e2c6f67ef5ca59598f5d487fb68d5e00"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.8.0", shell_output("\#{bin}/agenttrace --version")
  end
end
