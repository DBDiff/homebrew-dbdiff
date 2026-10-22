# Written by scripts/update-formula.sh — edit that, not this.
class Dbdiff < Formula
  desc "Diff MySQL, PostgreSQL and SQLite databases and generate migrations"
  homepage "https://github.com/DBDiff/DBDiff"
  version "3.0.0-rc.31"
  license "MIT"

  # A self-contained static binary per platform: PHP and DBDiff in one file.
  on_macos do
    on_arm do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-darwin-arm64"
      sha256 "b8c39cd2ea1562556f6c3172d34b26074d80902043059dbc5ee6ffc2ba64e33f"
    end
    on_intel do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-darwin-x64"
      sha256 "8524d4ecb182b91816ac41af407a4e5697538a3678f6fd3140eb83e4e83d166e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-linux-arm64"
      sha256 "4843d3a20fce4f13be09f459e02cda4b41d69c4fd7b25fefc3dbfd2084f523c4"
    end
    on_intel do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-linux-x64"
      sha256 "fadc6d960006a0dc71b764c374840be54456db0cd0692a16a043cecc201f1b5f"
    end
  end

  def install
    bin.install Dir["dbdiff-*"].first => "dbdiff"
  end

  test do
    assert_match "DBDiff #{version}", shell_output("#{bin}/dbdiff --version")
  end
end
