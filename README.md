# Odin Stock Picker Project

Implements a stock picker that given daily stock prices for a stock, identifies the
best day to buy and the best day to sell that stock.

[Odin Stock Picker Project](https://www.theodinproject.com/lessons/ruby-stock-picker)

[Solution Code](lib/odin/stock_picker.rb)

[RSpec Tests](spec/odin/stock_picker_spec.rb)

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add odin-stock_picker
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install odin-stock_picker
```

## Usage

```ruby
> require 'odin/stock_picker'
=> true
Odin::StockPicker.stockpicker([17, 3, 6, 9, 15, 8, 6, 1, 10])
=> [1, 4] # for a profit of $15 - $3 == $12
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jcouball/odin-stock_picker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jcouball/odin-stock_picker/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Odin::StockPicker project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jcouball/odin-stock_picker/blob/main/CODE_OF_CONDUCT.md).
