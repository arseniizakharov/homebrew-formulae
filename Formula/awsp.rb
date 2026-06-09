class Awsp < Formula
  desc "AWS CLI sessions manager"
  homepage "https://github.com/arseniizakharov/awsp"
  url "https://github.com/arseniizakharov/awsp/releases/download/v1.0.10/awsp-v1.0.10-aarch64-apple-darwin.tar.gz"
  sha256 "08bc1b5c95d900c5fe02b62b34ed9094578a210f55992b1c39d20233fe6c1087"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "awsp"
  end

  def caveats
    <<~EOS
      Homebrew installed awsp but did not modify your shell startup files.
      Homebrew also did not install AWS CLI; awsp checks for `aws` at runtime.

      Enable shell integration once:
        awsp setup zsh

      For bash:
        awsp setup bash

      Then restart the shell, or enable it immediately:
        source "$HOME/.config/awsp/shell/awsp.sh"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/awsp --version")
    assert_match "awsp shell integration", shell_output("#{bin}/awsp init zsh")
  end
end
