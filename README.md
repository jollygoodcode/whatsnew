# What's New?

What's New of a project?

Where is the document which documents changes between two releases?

## Installation

Add this line to your application's Gemfile:

```ruby
gem "whatsnew"
```

Or install:

    $ gem install whatsnew

## Usage

### Command line usage

```
$ `whatsnew`

What's New:
See CHANGELOG.md: https://github.com/jollygoodcode/whatsnew.
```

### API usage

```ruby
news = whatsnew.about "/Users/Juan/dev/whatsnew"

news.filename
=> "CHANGELOG.md"

news.url
=> "https://github.com/jollygoodcode/whatsnew/CHANGELOG.md"

news.content
=> "...content..."
```

## What it search for?

* `CHANGELOG`, `CHANGE`, `CHANGES`, `HISTORY`, `NEWS` in the root of project (regardless of file extension).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## Credits

A huge THANK YOU to all our [contributors](https://github.com/jollygoodcode/whatsnew/graphs/contributors)! :heart:

This project is maintained by [Jolly Good Code](http://www.jollygoodcode.com).

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.md).
