# What's New?

[![Gem Version](https://badge.fury.io/rb/whatsnew.svg)](http://badge.fury.io/rb/whatsnew)
[![Build Status](https://travis-ci.org/jollygoodcode/whatsnew.svg?branch=master)](https://travis-ci.org/jollygoodcode/whatsnew)

What's New in a project?

This gem is used in [deppbot](https://www.deppbot.com) to build awesome, automated Pull Request descriptions for `bundle update` like [this one in Ruby Bench](https://github.com/ruby-bench/ruby-bench-web/pull/122).

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

### Command Line Usage

```
$ whatsnew

What's New:
See CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md.
```

### API for Local Files

```ruby
news = Whatsnew.about "/Users/Juan/dev/whatsnew"

news.file_name
=> "CHANGELOG.md"

news.file_url
=> "https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md"

news.content
=> "Content of CHANGELOG.md"

news.read
=> "What's New:\nSee CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md."
```

### API for Remote Files

#### Example use with [Octokit](https://github.com/octokit/octokit.rb)

First [get an access token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/), then:

```ruby
client = Octokit::Client.new(access_token: ENV["OAUTH_TOKEN"])

news = Whatsnew.about client.contents("jollygoodcode/whatsnew")

news.file_name
=> "CHANGELOG.md"

news.file_url
=> "https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md"

news.read
=> "What's New:\nSee CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md."
```

Note that you can pass in any array of objects to `Whatsnew.about`, but each object must respond to `:name` and `:html_url` methods:

```ruby
Resource = Struct.new(:name, :html_url)

news = Whatsnew.about [Resource.new("NEWS", "https://github.com/ruby/ruby/blob/trunk/NEWS")]

news.file_name
=> "NEWS"

news.file_url
=> "https://github.com/ruby/ruby/blob/trunk/NEWS"

news.read
=> "What's New:\nSee NEWS: https://github.com/ruby/ruby/blob/trunk/NEWS."
```

## What Does It Search For?

* `CHANGELOG`, `CHANGE`, `CHANGES`, `HISTORY`, `NEWS` in the root of the project (regardless of file extension).

* It doesn't search for changelog listed in README.

## Development

See [DEVELOPMENT.md](DEVELOPMENT.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## Inspired by

[benbalter/licensee](https://github.com/benbalter/licensee) - A RubyGem to detect under what license a project is distributed.

## Credits

A huge THANK YOU to all our [contributors](https://github.com/jollygoodcode/whatsnew/graphs/contributors)! :heart:

This project is maintained by [Jolly Good Code](http://www.jollygoodcode.com).

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.md).
