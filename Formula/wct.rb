class Wct < Formula
  desc "Git worktree workflow automation CLI"
  homepage "https://github.com/dmtr-p/wct"
  version "1.3.1"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v1.3.1/wct-darwin-arm64"
      sha256 "f2c012df414ae49cb33893e28f4f7c693044d5de705b445fd2492c866996d55d"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v1.3.1/wct-darwin-x64"
      sha256 "a72676645769da9ea30d434a2a8885a74d0906c27633b90e753eb4a4779cf909"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v1.3.1/wct-linux-arm64"
      sha256 "9909f3aa6c3c6b2d9ee542b6408666855c28c285382804ae286b5a36bcb1372f"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v1.3.1/wct-linux-x64"
      sha256 "4a849450a2d8a7ca53974dde283c50590cd6a610c0ef7d83393ce820e206337b"
    end
  end

  resource "bash-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.3.1/wct.bash"
    sha256 "58275e862b2ac9e28b77d4809d7c6a17df4abe153cff5152d4c6743a49956445"
  end

  resource "zsh-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.3.1/_wct"
    sha256 "8c3646b3bbf65b326bc0708040cf2ae9957cb4bcfd3f55dcb772035972184b6c"
  end

  resource "fish-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.3.1/wct.fish"
    sha256 "157b09709eef2ae6f607fdbfda9184610cf9ec1b15ea3367868c3c09d416c3c3"
  end

  def install
    binary = Dir["wct-*"].first || "wct"
    bin.install binary => "wct"

    resource("bash-completion").stage do
      bash_completion.install "wct.bash" => "wct"
    end

    resource("zsh-completion").stage do
      zsh_completion.install "_wct"
    end

    resource("fish-completion").stage do
      fish_completion.install "wct.fish"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wct --version")
  end
end
