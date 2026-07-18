class Wct < Formula
  desc "Git worktree workflow automation CLI"
  homepage "https://github.com/dmtr-p/wct"
  version "2.0.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v2.0.0/wct-darwin-arm64"
      sha256 "af97b31d787690358cda350dc2121f3fcafb6a4fe7662cf8fd4461e1f1dbcf9a"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v2.0.0/wct-darwin-x64"
      sha256 "96e9002da50dff964fad7607411876596b67c86a2d6e2f8e4cb63d1253853c34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v2.0.0/wct-linux-arm64"
      sha256 "88cc8740a1e45466abd3da6b6a2bf12bf826b6144c0f9d83866c56a294571eb9"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v2.0.0/wct-linux-x64"
      sha256 "6d1e9dc8cd2523e62d2c1ecf00a11d4249ba230b198bb4eb5d5d8fc575f564ea"
    end
  end

  resource "bash-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v2.0.0/wct.bash"
    sha256 "6e922fe4cc9057f19ef35490dd82556d40b423a003c0e80b7becb657ba279443"
  end

  resource "zsh-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v2.0.0/_wct"
    sha256 "f37bfb672f45e9e8a1bb1c6f162cd73a25712798bda11ed42bba9e4e324d2ea3"
  end

  resource "fish-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v2.0.0/wct.fish"
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
