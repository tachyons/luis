# Luis

Microsoft Language Understanding Intelligent Service (LUIS) Ruby client

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'luis'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install luis

## Usage

```ruby
Luis.configure do |config|
 config.id = "<id>"
 config.subscription_key ="<key>"
 config.is_preview_mod = true
end
```

```ruby
Luis.query("Book flight to Banagalore")
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tachyons/luis. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

