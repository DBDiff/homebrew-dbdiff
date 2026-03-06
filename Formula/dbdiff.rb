class Dbdiff < Formula
  desc "Compare MySQL, Postgres or SQLite databases & generate schema/data migrations"
  homepage "https://github.com/DBDiff/DBDiff"
  license "MIT"
  version "2.0.0"

  # ── Platform-specific binary downloads ──────────────────────────────────────
  # ── Platform-specific binary downloads ──────────────────────────────────────
  #
  # SHA256 values are stamped by scripts/update-homebrew-formula.sh after each
  # GitHub release is published.  Run:
  #
  #   scripts/update-homebrew-formula.sh 2.0.1 ../homebrew-dbdiff
  #
  on_macos do
    on_arm do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-darwin-arm64"
      sha256 "PLACEHOLDER_darwin_arm64" # bumped by update-homebrew-formula.sh
    end
    on_intel do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-darwin-x64"
      sha256 "PLACEHOLDER_darwin_x64" # bumped by update-homebrew-formula.sh
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-linux-arm64"
      sha256 "PLACEHOLDER_linux_arm64" # bumped by update-homebrew-formula.sh
    end
    on_intel do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-linux-x64"
      sha256 "PLACEHOLDER_linux_x64" # bumped by update-homebrew-formula.sh
    end
  end

  # No compilation — the binary is a fully self-contained static executable
  # (static PHP micro SAPI + DBDiff PHAR combined into a single file)
  bottle :unneeded

  def install
    # Determine the asset filename downloaded by Homebrew for this platform
    asset = if OS.mac?
      Hardware::CPU.arm? ? "dbdiff-darwin-arm64" : "dbdiff-darwin-x64"
    else
      Hardware::CPU.arm? ? "dbdiff-linux-arm64" : "dbdiff-linux-x64"
    end

    bin.install asset => "dbdiff"
  end

  test do
    output = shell_output("#{bin}/dbdiff --version")
    assert_match "DBDiff #{version}", output
  end
end
