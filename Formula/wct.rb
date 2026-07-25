class Wct < Formula
  desc "Git worktree workflow automation CLI"
  homepage "https://github.com/dmtr-p/wct"
  version "2.0.1"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v2.0.1/wct-darwin-arm64"
      sha256 "d08c69d6dfb48d480368d06dbe12c3f1dff1e7eb782c8c0cf0e38f62b59bb651"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v2.0.1/wct-darwin-x64"
      sha256 "7e245c09b722aef68ef7a85b84744c245291c3c5b3c5b7d4bd168ee33fa3ac92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v2.0.1/wct-linux-arm64"
      sha256 "9ffa1bd2c6e348211df6396092576248139a5f1bf04461e88813d7ec55206586"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v2.0.1/wct-linux-x64"
      sha256 "6e459a05fd74dca8e5284c9351f1aa9632e89e3a8ffebc1c51275164492b2f01"
    end
  end

  resource "bash-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v2.0.1/wct.bash"
    sha256 "6e922fe4cc9057f19ef35490dd82556d40b423a003c0e80b7becb657ba279443"
  end

  resource "zsh-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v2.0.1/_wct"
    sha256 "f37bfb672f45e9e8a1bb1c6f162cd73a25712798bda11ed42bba9e4e324d2ea3"
  end

  resource "fish-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v2.0.1/wct.fish"
    sha256 "8f08b353092ae9849510f4e61efb9234f50e37a02226d079903f0a9c6983b9b4"
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
