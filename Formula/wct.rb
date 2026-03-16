class Wct < Formula
  desc "Git worktree workflow automation CLI"
  homepage "https://github.com/dmtr-p/wct"
  version "1.4.1"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v1.4.1/wct-darwin-arm64"
      sha256 "1b08b4590bf970dd108e59b30ce7577b7ebf53cf3fb678e9c62f57d76780302c"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v1.4.1/wct-darwin-x64"
      sha256 "2e21b69936b07b7f15329c87eae62bb9478da7467f516b5b6a2b878d132d0a1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v1.4.1/wct-linux-arm64"
      sha256 "d74532ffa64f62c6a5a71d349410d76401eb804eddb5924dd615e66c5d67c1e1"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v1.4.1/wct-linux-x64"
      sha256 "55f8a5fe416567f1ad199cdd2b20de530da7e738785fce710e95f761744c94f4"
    end
  end

  resource "bash-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.4.1/wct.bash"
    sha256 "27d49585316adb27a33cc1e06b87751f02bd6a2ca3b0fd02e6bf144b7409d281"
  end

  resource "zsh-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.4.1/_wct"
    sha256 "b1a2adf59aa6cc86326fae1d0777225d716174b4a40a6e0b660f916de0097b86"
  end

  resource "fish-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.4.1/wct.fish"
    sha256 "9195a2872c7efb21fed742c6dca48915f60f1f523b3a5b597eb82ae9e7708697"
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
