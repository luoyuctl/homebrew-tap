class Agenttrace < Formula
  desc "TUI observability for AI coding-agent session history, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.7.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.7.7/agenttrace-darwin-arm64"
      sha256 "3126fc12ddf61ae2323db145ee1d1ac7851996d337f4ea320a79f4adf38e63bc"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.7.7/agenttrace-darwin-amd64"
      sha256 "6af7cd603e8ae3277183d880318fbf3428cbaa76bb1cd87d30c54e4bdb68c108"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.7.7/agenttrace-linux-arm64"
      sha256 "bf393f63612b95881cfe5f94cbbb82ddc6bef8c0d9fd643a616227390be0e258"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.7.7/agenttrace-linux-amd64"
      sha256 "387ed1a93ef268f5fee9ce592a083fe3fbddf5b04cb463f530036ed9e3f0b2f7"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.7.7", shell_output("\#{bin}/agenttrace --version")
  end
end
