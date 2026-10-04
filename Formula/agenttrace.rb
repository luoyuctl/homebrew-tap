class Agenttrace < Formula
  desc "TUI observability for AI coding-agent session history, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.10.0/agenttrace-darwin-arm64"
      sha256 "3f084aaf5a251a0994c1d76e435f4bd97aa6208c83869d3a422d64520f8f45c8"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.10.0/agenttrace-darwin-amd64"
      sha256 "1b304d71dc4f28f4618e7347a38ed6882bf219ca7a724d18d8b5282b4f51cf27"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.10.0/agenttrace-linux-arm64"
      sha256 "f82452e094d16b4b28d4cf268d90fb7a1bd4cfcf9259ead7a49930473f2d3fd7"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.10.0/agenttrace-linux-amd64"
      sha256 "afec8b9340a6eca715d287ad3a71db7b075370d19b1e00383dbb10d043b04109"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.10.0", shell_output("\#{bin}/agenttrace --version")
  end
end
