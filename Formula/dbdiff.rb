# Written by scripts/update-formula.sh — edit that, not this.
class Dbdiff < Formula
  desc "Diff MySQL, PostgreSQL and SQLite databases and generate migrations"
  homepage "https://github.com/DBDiff/DBDiff"
  version "3.0.0-rc.32"
  license "MIT"

  # A self-contained static binary per platform: PHP and DBDiff in one file.
  on_macos do
    on_arm do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-darwin-arm64"
      sha256 "75b1b2396ba6b4993cd45d8f03f008bbb53c7793feb47e03a20c43cbe07d508f"
    end
    on_intel do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-darwin-x64"
      sha256 "8f7d6152aeb242068bcaf6baf31d6b9a4b895823bbc102d3fe3e042d2823e2b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-linux-arm64"
      sha256 "9f99f36d524b51c2891a20ca99d3a5c7997198da171d1a2e63112482462ece79"
    end
    on_intel do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-linux-x64"
      sha256 "2f03f153609ce7c405701dafde800e2add6b8e949d06afe49c3234bbaaa9cac8"
    end
  end

  def install
    bin.install Dir["dbdiff-*"].first => "dbdiff"
  end

  test do
    assert_match "DBDiff #{version}", shell_output("#{bin}/dbdiff --version")
  end
end
