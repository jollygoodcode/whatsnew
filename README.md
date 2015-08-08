# What's New?

What's New of a project?

Where is the document which documents changes between two releases?

## Installation

Add this line to your application's Gemfile:

```ruby
gem "whatsnew"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install whatsnew

## Usage

### Command line usage

```
$ whatsnew

What's New:
See CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md.
```

### API usage

```ruby
news = Whatsnew.about "/Users/Juan/dev/whatsnew"

news.file_name
=> "CHANGELOG.md"

news.file_url
=> "https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md"

news.content
=> "What's New:\nSee CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md."
```

## What it search for?

* `CHANGELOG`, `CHANGE`, `CHANGES`, `HISTORY`, `NEWS` in the root of project (regardless of file extension).

## Development

See [DEVELOPMENT.md](DEVELOPMENT.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## Credits

A huge THANK YOU to all our [contributors](https://github.com/jollygoodcode/whatsnew/graphs/contributors)! :heart:

This project is maintained by [Jolly Good Code](http://www.jollygoodcode.com).

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.md).