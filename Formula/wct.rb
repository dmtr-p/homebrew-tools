class Wct < Formula
  desc "Git worktree workflow automation CLI"
  homepage "https://github.com/dmtr-p/wct"
  version "1.4.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v1.4.0/wct-darwin-arm64"
      sha256 "f1acce64fae8ea1ad0bd54d0118ce8131a694763f7acf461295ebdaccb4261ab"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v1.4.0/wct-darwin-x64"
      sha256 "73aaf79dc225081499a51cf6e56d17560b70ea7a7c1194b844572f9c97b38e5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v1.4.0/wct-linux-arm64"
      sha256 "a22201d835c4dd4afc897ac54d1c725141f0efb890e6e0da36f285ed351ca0a0"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v1.4.0/wct-linux-x64"
      sha256 "7833191aa3ea521ca66d83c1de0747811c2a19dc51ec293822b06943329ff132"
    end
  end

  resource "bash-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.4.0/wct.bash"
    sha256 "27d49585316adb27a33cc1e06b87751f02bd6a2ca3b0fd02e6bf144b7409d281"
  end

  resource "zsh-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.4.0/_wct"
    sha256 "b1a2adf59aa6cc86326fae1d0777225d716174b4a40a6e0b660f916de0097b86"
  end

  resource "fish-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.4.0/wct.fish"
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
