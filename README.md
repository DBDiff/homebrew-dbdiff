# homebrew-dbdiff

[Homebrew](https://brew.sh) tap for [DBDiff](https://github.com/DBDiff/DBDiff) — the database diff and migration tool for MySQL, Postgres, and SQLite.

## Install

```bash
brew tap DBDiff/dbdiff
brew install dbdiff
```

## Usage

```bash
# Diff two MySQL schemas
dbdiff user:pass@host:3306 db1:db2

# Diff two Postgres schemas (full DSN)
dbdiff --server1-url postgres://user:pass@host:5432/db1 \
       --server2-url postgres://user:pass@host:5432/db2

# Supabase shorthand
dbdiff --supabase --server1=user:pass@db.abc.supabase.co:5432 db1:db2

# Generate a migration file in a specific format
dbdiff --format=laravel user:pass@host:3306 db1:db2
```

## Upgrade

```bash
brew upgrade dbdiff
```

## Uninstall

```bash
brew uninstall dbdiff
brew untap DBDiff/dbdiff
```

## More information

- **GitHub:** https://github.com/DBDiff/DBDiff
- **npm:** `npm install -g @dbdiff/cli`
- **Issues:** https://github.com/DBDiff/DBDiff/issues
