# Homebrew Formula for agenttrace
# Usage: brew install luoyuctl/tap/agenttrace
# Formula source: https://github.com/luoyuctl/homebrew-tap/blob/main/Formula/agenttrace.rb

class Agenttrace < Formula
  desc "TUI observability for AI coding agent sessions, cost, latency, and anomalies"
  homepage "https://github.com/luoyuctl/agenttrace"
  version "0.3.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.17/agenttrace-darwin-arm64"
      sha256 "c24946cd833fa0f11f1f558330137276c25aaa19aceffaf9a110d342f6fc61ab"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.17/agenttrace-darwin-amd64"
      sha256 "f2aaa1a1181bd8ff2fabfde310b1f69b971f168b045d08d1f26674fe97b4c685"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.17/agenttrace-linux-arm64"
      sha256 "5cc977eb5b58dafbfa772cee0f12153fdcb464a4d04d6417940bf3ed449165d3"
    else
      url "https://github.com/luoyuctl/agenttrace/releases/download/v0.3.17/agenttrace-linux-amd64"
      sha256 "1ca71973752a121e1b87d01d35a8d9301679379634e1b15d6c73e41702782663"
    end
  end

  def install
    bin.install Dir["agenttrace-*"].first => "agenttrace"
    chmod 0755, bin/"agenttrace"
  end

  test do
    assert_match "agenttrace v0.3.17", shell_output("#{bin}/agenttrace --version")
  end
end
