class Wct < Formula
  desc "Git worktree workflow automation CLI"
  homepage "https://github.com/dmtr-p/wct"
  version "1.5.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v1.5.0/wct-darwin-arm64"
      sha256 "89eb61ed401ec3bd0905f7d773f37cb149855839b457ca6b873dceae9f462312"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v1.5.0/wct-darwin-x64"
      sha256 "f215fc91b6930d8daa327ed150c41908a95b6da43ae3b5d776e6d6f31f15535c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v1.5.0/wct-linux-arm64"
      sha256 "8f2ea71f70c2a1f419c2d010dc92e98f4d8d17db7dae25364032739255cdb997"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v1.5.0/wct-linux-x64"
      sha256 "2708d4529c04735d3aac32805aed557fe9d08cce2d556ab26869c7b725b9b48c"
    end
  end

  resource "bash-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.5.0/wct.bash"
    sha256 "5be1ba8e48256d5876671c867d01e8c1fcfacbc23ebf2e1d4782e1363335437c"
  end

  resource "zsh-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.5.0/_wct"
    sha256 "b95d0eda4968b05c737b120c580664fc56aac1a32c5d102ca47570798e125c74"
  end

  resource "fish-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v1.5.0/wct.fish"
    sha256 "fe01b335289238bfc2cf54d8c499d0d26528390928d850e2088c845c76d5dd4d"
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
