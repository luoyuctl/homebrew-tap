# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.14/agenttrace-darwin-arm64"
      sha256 "3d248528004a2f1415b31968ddf1db4b3639fc80a51eb93b63f1705c298cc07c"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.14/agenttrace-darwin-amd64"
      sha256 "314078b16e539e2950fb946f1d127ef3677590331b742e79d70ee2934e0d2086"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.14/agenttrace-linux-arm64"
      sha256 "f3f8b008f0a0ebed1410a32a43c9735782c41adcc5b0494a6c8375b42f274e14"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.14/agenttrace-linux-amd64"
      sha256 "e9d000f423944dba3d9a92e7183210035c8e2eee245eb559de86e9f1282eedc3"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.14", shell_output("#{bin}/agenttrace --version")
  end
end
