# PolishCellNumberChecker

Checks if phone number is cell number and get GSM operator name.

## Installation

Add this line to your application's Gemfile:

    gem 'polish_cell_number_checker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install polish_cell_number_checker

## Usage

```ruby
p = PolishCellNumber::Checker.new('+48 608-111-111')
p.cell_number? => true
p.operator_name => "PTC S.A."
```

Copyright (c) 2012 [Damian Baćkowski], released under the MIT license