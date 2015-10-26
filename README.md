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

First [get an access token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/), then instantiate a client:

```ruby
client = Octokit::Client.new(access_token: ENV["OAUTH_TOKEN"])
```

##### [Contents API](https://developer.github.com/v3/repos/contents/#get-contents)

```ruby
news = Whatsnew.about client.contents("jollygoodcode/whatsnew")

news.file_name
=> "CHANGELOG.md"

news.file_url
=> "https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md"

news.content
=> "See https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md"

news.read
=> "What's New:\nSee CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md."
```

##### [Releases API](https://developer.github.com/v3/repos/releases/)

```ruby
news = Whatsnew.about client.releases("jollygoodcode/whatsnew")

news.file_name
=> "Releases"

news.file_url
=> "https://github.com/jollygoodcode/whatsnew/releases"

news.content
=> "See https://github.com/jollygoodcode/whatsnew/releases"

news.read
=> "What's New:\nSee Releases: https://github.com/jollygoodcode/whatsnew/releases."
```

##### Any Object respond to certain messages

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

* changelog-like file

  `CHANGELOG`, `CHANGE`, `CHANGES`, `HISTORY`, `NEWS` in the root of the project (regardless of file extension).

* It doesn't search for changelog listed in README (regardless of file extension)
* If a changelog-like file cannot be found, will try to see if [GitHub Releases](https://github.com/blog/1547-release-your-software) has contents to show

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

We specialise in Agile practices and Ruby, and we love contributing to open source.
[Speak to us](http://www.jollygoodcode.com/#get-in-touch) about your next big idea, or [check out our projects](http://www.jollygoodcode.com/open-source).
