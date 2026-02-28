class Wct < Formula
  desc "Git worktree workflow automation CLI"
  homepage "https://github.com/dmtr-p/wct"
  version "1.2.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v1.2.0/wct-darwin-arm64"
      sha256 "e5097d9db10bb9265f2719b2a3bfbb44ea3e1378f883f5b3afb9ffba9b814eb0"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v1.2.0/wct-darwin-x64"
      sha256 "59bf359d6912532e573c0cf1f628ee216ae73221bf26744ea68f10e3a96f7c23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtr-p/wct/releases/download/v1.2.0/wct-linux-arm64"
      sha256 "3798e4b468e370804a24c2910860c3d5f490da6b68ca0322d9c89392a67632c2"
    end

    on_intel do
      url "https://github.com/dmtr-p/wct/releases/download/v1.2.0/wct-linux-x64"
      sha256 "5ce15cab807a48dcbe555d5d391dc6ab836e6d78d107290ba878d1ea320b664e"
    end
  end

  def install
    binary = Dir["wct-*"].first || "wct"
    bin.install binary => "wct"

    generate_completions_from_executable(bin/"wct", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wct --version")
  end
end
