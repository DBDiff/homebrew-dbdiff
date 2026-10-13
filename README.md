# homebrew-dbdiff

[Homebrew](https://brew.sh) tap for [DBDiff](https://github.com/DBDiff/DBDiff):
diff MySQL, PostgreSQL and SQLite databases and generate migrations. It
installs DBDiff's self-contained binary — no PHP needed — on macOS and Linux,
Apple Silicon, Intel and ARM.

## Install

```bash
brew install dbdiff/dbdiff/dbdiff
```

or `brew tap dbdiff/dbdiff` then `brew install dbdiff`.

## Usage

```bash
# Schema and data, Postgres to Postgres, from connection strings
dbdiff diff --server1-url postgres://user:pass@host:5432/staging \
            --server2-url postgres://user:pass@host:5432/production \
            --type=all --include=both --output=migration.sql

# MySQL, two databases on one server
dbdiff diff --server1=user:pass@localhost:3306 --type=schema app_dev:app_prod

# SQLite files
dbdiff diff --server1-url sqlite:///path/to/a.db --server2-url sqlite:///path/to/b.db
```

`dbdiff diff --help` lists every option. See the
[DBDiff README](https://github.com/DBDiff/DBDiff#readme) for the rest.

## Upgrade

```bash
brew update && brew upgrade dbdiff
```

The formula follows DBDiff's releases automatically.

## License

MIT
