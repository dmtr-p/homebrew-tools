class Wct < Formula
  desc "Git worktree workflow automation CLI"
  homepage "https://github.com/dmtr-p/wct"
  version "1.2.1"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v1.2.1/wct-darwin-arm64"
      sha256 "835a2f4345fd87c4282d87875993c359c60ac11ba2587577dcf362a8c46011f0"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v1.2.1/wct-darwin-x64"
      sha256 "b77cbc2697c066638503bd2234a023cde9cca730cf4fea6328ff9ffc05a20fa9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v1.2.1/wct-linux-arm64"
      sha256 "54df9f52507c0f2d0707d80ab2c3839189e62597836faeac7abc7dc5e337703c"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v1.2.1/wct-linux-x64"
      sha256 "07fd8ae53efe3357f31c84ef48999e0f534ce4a7c99d65326f41a24a97d73292"
    end
  end

  resource "bash-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.2.1/wct.bash"
    sha256 "849ea76ec5e59659c36735fa1fdf4cc3547ff8905e8392de0bf64776f5a0c608"
  end

  resource "zsh-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.2.1/_wct"
    sha256 "cc406b820c3f4dc4ac4de3c3c1acae09248d5032771eac8acaf2681aea427c53"
  end

  resource "fish-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.2.1/wct.fish"
    sha256 "d53e8abecafe104aa5ce139739bced1ba1666bbc7ad9d9792678b1d0f7ce80cb"
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
