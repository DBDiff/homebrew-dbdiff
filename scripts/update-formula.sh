#!/usr/bin/env bash
# Rewrite Formula/dbdiff.rb for a DBDiff release: its version and the SHA-256
# of each platform binary, read from the release's assets.
#
#   scripts/update-formula.sh 3.0.0-rc.27
set -euo pipefail

version="${1:?usage: $0 <version>   e.g. 3.0.0-rc.27}"
base="https://github.com/DBDiff/DBDiff/releases/download/v${version}"
cd "$(dirname "$0")/.."

sha() {
  local sum
  sum="$(curl -fsSL "$base/$1" | sha256sum | cut -d' ' -f1)"
  [ ${#sum} -eq 64 ] || { echo "could not download $base/$1" >&2; exit 1; }
  echo "$sum"
}

darwin_arm64="$(sha dbdiff-darwin-arm64)"
darwin_x64="$(sha dbdiff-darwin-x64)"
linux_arm64="$(sha dbdiff-linux-arm64)"
linux_x64="$(sha dbdiff-linux-x64)"

cat > Formula/dbdiff.rb <<RUBY
# Written by scripts/update-formula.sh — edit that, not this.
class Dbdiff < Formula
  desc "Diff MySQL, PostgreSQL and SQLite databases and generate migrations"
  homepage "https://github.com/DBDiff/DBDiff"
  version "${version}"
  license "MIT"

  # A self-contained static binary per platform: PHP and DBDiff in one file.
  on_macos do
    on_arm do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-darwin-arm64"
      sha256 "${darwin_arm64}"
    end
    on_intel do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-darwin-x64"
      sha256 "${darwin_x64}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-linux-arm64"
      sha256 "${linux_arm64}"
    end
    on_intel do
      url "https://github.com/DBDiff/DBDiff/releases/download/v#{version}/dbdiff-linux-x64"
      sha256 "${linux_x64}"
    end
  end

  def install
    bin.install Dir["dbdiff-*"].first => "dbdiff"
  end

  test do
    assert_match "DBDiff #{version}", shell_output("#{bin}/dbdiff --version")
  end
end
RUBY
echo "Formula/dbdiff.rb → ${version}"
