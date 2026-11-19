# Written by scripts/update-formula.sh — edit that, not this.
class Dbdiff < Formula
  desc "Diff MySQL, PostgreSQL and SQLite databases and generate migrations"
  homepage "https://github.com/DBDiff/DBDiff"
  version "3.0.0-rc.39"
  license "MIT"

  # A self-contained static binary per platform: PHP and DBDiff in one file.
  on_macos do
    on_arm do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-darwin-arm64"
      sha256 "5e2c19a9563b971a3cdaa9700ac63ada51e9708e7015bfa2f11b1ef5c13ad576"
    end
    on_intel do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-darwin-x64"
      sha256 "e1f1a8371085732b97771c2e54e949b1a6349b9fec1def83e995c85b4d741c45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-linux-arm64"
      sha256 "c745924453077cda7991b28a59d2f55ffd48f9dd0e9f98da28589d308f73eb8d"
    end
    on_intel do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-linux-x64"
      sha256 "74406617b59d4c3e8b9f2b6e5eff9f6e3e2430141fb4b278bcc07b0eda82ed9a"
    end
  end

  def install
    bin.install Dir["dbdiff-*"].first => "dbdiff"
  end

  test do
    assert_match "DBDiff #{version}", shell_output("#{bin}/dbdiff --version")
  end
end
