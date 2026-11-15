# Written by scripts/update-formula.sh — edit that, not this.
class Dbdiff < Formula
  desc "Diff MySQL, PostgreSQL and SQLite databases and generate migrations"
  homepage "https://github.com/DBDiff/DBDiff"
  version "3.0.0-rc.37"
  license "MIT"

  # A self-contained static binary per platform: PHP and DBDiff in one file.
  on_macos do
    on_arm do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-darwin-arm64"
      sha256 "ac517fb21554d0ccca56573331360d28e89ddf8f70e93fca63bc4dd059974881"
    end
    on_intel do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-darwin-x64"
      sha256 "976b0ae4a08ac99ba805ab14305e3c19edf68c38a15fd2c2cb9382ccc3edba03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-linux-arm64"
      sha256 "4a056168d6f15879d0d576cda14534e076f443bee01f681c1256e0de272713ae"
    end
    on_intel do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-linux-x64"
      sha256 "d9338287f128e57f33b846a164cdca1d4a97dd6ea1fd4a169449cef3002dbd64"
    end
  end

  def install
    bin.install Dir["dbdiff-*"].first => "dbdiff"
  end

  test do
    assert_match "DBDiff #{version}", shell_output("#{bin}/dbdiff --version")
  end
end
