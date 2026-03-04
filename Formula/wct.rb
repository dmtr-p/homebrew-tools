class Wct < Formula
  desc "Git worktree workflow automation CLI"
  homepage "https://github.com/dmtr-p/wct"
  version "1.3.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v1.3.0/wct-darwin-arm64"
      sha256 "1090e0177dcdbbf4f0941e86050c5fbc2ccf7b182394712955f323a7bea20ffc"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v1.3.0/wct-darwin-x64"
      sha256 "3c9e6ce618fe6a617d5afd646ea38bed06e879725db34bb471517933bc40675c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v1.3.0/wct-linux-arm64"
      sha256 "9364002563621e912f759cce1feb453fe80a189a82a906c05fffde13f6d87bc6"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v1.3.0/wct-linux-x64"
      sha256 "f8eac124e18b0e5ac93ba23efc7d94a2df6afdf5512d760354b3eb6f1b8700e0"
    end
  end

  resource "bash-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.3.0/wct.bash"
    sha256 "58275e862b2ac9e28b77d4809d7c6a17df4abe153cff5152d4c6743a49956445"
  end

  resource "zsh-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.3.0/_wct"
    sha256 "8c3646b3bbf65b326bc0708040cf2ae9957cb4bcfd3f55dcb772035972184b6c"
  end

  resource "fish-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.3.0/wct.fish"
    sha256 "f3f6b2561b2882973f0e0681684f2cc5422594765a36096ba0a3793f84eb80b5"
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
