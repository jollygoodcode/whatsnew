# What's New?

[![Gem Version](https://badge.fury.io/rb/whatsnew.svg)](http://badge.fury.io/rb/whatsnew)
[![Build Status](https://travis-ci.org/jollygoodcode/whatsnew.svg?branch=master)](https://travis-ci.org/jollygoodcode/whatsnew)

What's New in a project?

This gem is used in [deppbot](https://www.deppbot.com) to retrieve a ruby gem's changelog for use in a Pull Request body, an example could be found in [this Pull Request on ruby-bench/ruby-bench-web](https://github.com/ruby-bench/ruby-bench-web/pull/122).

--

## Installation

Add this line to your application's Gemfile:

```ruby
gem "whatsnew"
```

And then execute:

```
$ bundle
```

Or install it yourself:

```
$ gem install whatsnew
```

## Usage

### First Setup an OAuth Token

Either pass it in as a command line argument

```
whatsnew --access-token=<your-40-char-token>
```

Or store it as an ENV variable: `OAUTH_ACCESS_TOKEN`.

### Get a OAuth Token

You can either get a [Personal Access Token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/) or [an OAuth token](https://developer.github.com/v3/oauth).

If you need to access private repository, make sure to specify the `repo` scope while creating your token.

If no OAuth token is provided, unauthenticated requests are limited to [60 requests per hour](https://developer.github.com/v3/#rate-limiting).

### Command Line Usage

By default `whatsnew about` without argument will search for changelog in the current folder:

```
$ whatsnew about
What's New:
See CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md.
```

You can also search for changelog in a GitHub repository:

```
$ whatsnew about jollygoodcode/twemoji
What's New:
See CHANGELOG.md: https://github.com/jollygoodcode/twemoji/blob/master/CHANGELOG.md.
```

If a [changelog-like file](#what-does-it-search-for) cannot be found, whatsnew will search for [GitHub Releases](https://github.com/blog/1547-release-your-software) (if it has any releases with non-empty release body):

```
$ whatsnew about benbalter/licensee
What's New:
See Releases: https://github.com/benbalter/licensee/releases.
```

Both changelog and release cannot be found:

```
$ whatsnew about
Not found. This project should keep a changelog.
Please see http://keepachangelog.com.
```

## What Does It Search For?

* changelog-like file

  `CHANGELOG`, `CHANGE`, `CHANGES`, `HISTORY`, `NEWS` in the root of the project (regardless of file extension).

* If a changelog-like file cannot be found, will try to see if [GitHub Releases](https://github.com/blog/1547-release-your-software) has contents to show

* It doesn't search for changelog listed in README

### API usage

`Whatsnew.about` API can take a path (see Local section below) or `owner/repo` (see Remote section below) string.

#### Local

Search in given path:

```ruby
news = Whatsnew.about "/Users/Juan/dev/whatsnew"

news.file_name
=> "CHANGELOG.md"

news.file_url
=> "https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md"
# or returns changelog's path if this project is not a git repository
=> "/Users/Juan/dev/whatsnew/CHANGELOG.md"

news.content
=> "Prints Content of CHANGELOG.md"

news.read
=> "What's New:\nSee CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md."
```

#### Remote

Search changelog-like file / releases on GitHub.

It will first search if a remote repository has a changelog file:

Search in given `owner/repo`:

```ruby
news = Whatsnew.about "jollygoodcode/whatsnew", oauth_token: "e72e16c7e42f292c6912e7710c838347ae178b4a"

news.file_name
=> "CHANGELOG.md"

news.file_url
=> "https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md"

news.content
=> "Please see: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md."

news.read
=> "What's New:\nSee CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md."
```

Then search for GitHub Releases with non-empty body.

```ruby
news = Whatsnew.about "benbalter/licensee", oauth_token: "e72e16c7e42f292c6912e7710c838347ae178b4a"

news.file_name
=> "Releases"

news.file_url
=> "https://github.com/benbalter/licensee/releases"

news.content
=> "See https://github.com/benbalter/licensee/releases."

news.read
=> "What's New:\nSee Releases: https://github.com/benbalter/licensee/releases."
```

## Inspired by

[benbalter/licensee](https://github.com/benbalter/licensee) - A RubyGem to detect under what license a project is distributed.

## Contributing

Please see the [CONTRIBUTING.md](/CONTRIBUTING.md) file.

## Credits

A huge THANK YOU to all our [contributors](https://github.com/jollygoodcode/whatsnew/graphs/contributors)! :heart:

## License

Please see the [LICENSE.md](/LICENSE.md) file.

## Maintained by Jolly Good Code

[![Jolly Good Code](https://cloud.githubusercontent.com/assets/1000669/9362336/72f9c406-46d2-11e5-94de-5060e83fcf83.jpg)](http://www.jollygoodcode.com)

We specialise in rapid development of high quality MVPs. [Hire us](http://www.jollygoodcode.com/#get-in-touch) to turn your product idea into reality.
