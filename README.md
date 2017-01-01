# AmaValidators

[![Gem Version](https://badge.fury.io/rb/ama_validators.png)](http://badge.fury.io/rb/ama_validators)
[![Code Climate](https://codeclimate.com/github/amaabca/ama_validators.png)](https://codeclimate.com/github/amaabca/ama_validators)
[![Build Status](https://travis-ci.org/amaabca/ama_validators.png?branch=master)](https://travis-ci.org/amaabca/ama_validators)
[![Coverage Status](https://coveralls.io/repos/amaabca/ama_validators/badge.png)](https://coveralls.io/r/amaabca/ama_validators)
[![Dependency Status](https://gemnasium.com/amaabca/ama_validators.png)](https://gemnasium.com/amaabca/ama_validators)

Compile the following validators: - Credit card - Email - Membership number - Phone number - Postal code

## Installation

Add this line to your Gemfile within your rails application:

    gem 'ama_validators'

And then execute:

    $ bundle install

## Usage

Apply the validator to a model like so:

```
class TeamMember < ApplicationRecord
  validates :email, presence: true, email_format: { allow_blank: false }
end
```

All of the validators are here: https://github.com/amaabca/ama_validators/tree/master/lib/ama_validators/ 


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
