[![Enterprise Modules](https://raw.githubusercontent.com/enterprisemodules/public_images/master/banner1.jpg)](https://www.enterprisemodules.com)

# EasyTypeHelpers

This gem provides custom RSpec matchers which are handy for developing easy_type
based modules.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_type_helpers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_type_helpers

## Usage

First require gem in `spec_helper.rb`

```ruby
require 'easy_type_helpers'
```

Then you can write tests based on examples from the `lib/easy_type_helpers/shared`.

I. ex.

```ruby
shared_examples "a port number" do
  it { is_expected.to accept_values('absent', 7001) }
  it { is_expected.to reject_values('a', '-1', '1:').with_error('is not valid as a port number') }
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/enterprisemodules/easy_type_helpers.
