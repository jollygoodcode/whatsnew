# CHANGELOG

## v1.0.1 - 2016.05.27

- Add support for `RELEASE_NOTES.*` [#10](https://github.com/jollygoodcode/whatsnew/pull/10)

## v1.0.0 - 2015-12-27

- Add support for searching GitHub releases [#9](https://github.com/jollygoodcode/whatsnew/pull/9)
- CLI rewrite in Thor gem
- Switch test suite to RSpec

### Incompatibilities

- `Whatsnew.about` API changes, please consult the [v1.0.0 README.md](https://github.com/jollygoodcode/whatsnew/blob/v1.0.0/README.md)

### API changes

## v0.4.1 - 2015-08-09

### Features

- Support more git config url matching [#6](https://github.com/jollygoodcode/whatsnew/pull/6)

### Bug Fixes

- Fix `whatsnew` executable failed to execute [#5](https://github.com/jollygoodcode/whatsnew/pull/5)

## v0.4.0 - 2015-08-09

### API CHANGES

- `NewsFile#content` => `NewsFile#read` [#4](https://github.com/jollygoodcode/whatsnew/pull/4)
- `NewsFile#content` => The content of the news file [#4](https://github.com/jollygoodcode/whatsnew/pull/4)
- Refactor the internal classes interfaces [#3](https://github.com/jollygoodcode/whatsnew/pull/3)

## v0.3.0 - 2015-08-09

- API Support finding news file from Octokit response [#1](https://github.com/jollygoodcode/whatsnew/pull/1)

## v0.2.0 - 2015-08-08

- NewsFile API changes

### Features

- Add `bin/dev` script for development

### Bug Fixes

- Fix matching git repository
- Fix search for a git repo without news file

## v0.1.0 - 2015-08-08

Project init. Can detect a local project's news file location.
