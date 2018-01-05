# String::Namecase

Simple proper name capitalization that handles (most) edge cases.

PRs are welcome for any cases that were missed!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string-namecase'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string-namecase

## Usage

```ruby
require 'string/namecase'
"JoHn O'NEILL".namecase # => "John O'Niell"
"jorge de la rosa".namecase # => "Jorge de la Rosa"
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kenaniah/string-namecase.
