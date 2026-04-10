class Wct < Formula
  desc "Git worktree workflow automation CLI"
  homepage "https://github.com/dmtr-p/wct"
  version "2.0.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v2.0.0/wct-darwin-arm64"
      sha256 "d55e466a4054697406362d4de29b0e45cb3ff30a30c3b2a87244719abd93b7e0"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v2.0.0/wct-darwin-x64"
      sha256 "be6a9fdf3dabf99efb296a5c623025c94b4d03344cfa0c19a23d1c1f6114849f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v2.0.0/wct-linux-arm64"
      sha256 "e1b1cc5cd4484873a342ea9548c19eaf5180f70ce69f9da9ad87cd4dac2acdd6"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v2.0.0/wct-linux-x64"
      sha256 "16621ef5fb57346ef2127bfd39fb195cbc3fcb756bef0b3d26b3b1c4fcf3a926"
    end
  end

  resource "bash-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v2.0.0/wct.bash"
    sha256 "338f91a8086f8da94e2bdd383ed66bfaa7236bc9224b63aa172a08ade42302a2"
  end

  resource "zsh-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v2.0.0/_wct"
    sha256 "0d19437c3c5a03cd934fa1b252ca9536a9b1f6a2409790a1217e9d6e4c095686"
  end

  resource "fish-completion" do
    url "https://github.com/dmtr-p/wct/releases/download/v2.0.0/wct.fish"
    sha256 "886d73eaa71ed01733c8543de4a760ba8c19e518fbb378e016d2bdc48c94d9f9"
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
