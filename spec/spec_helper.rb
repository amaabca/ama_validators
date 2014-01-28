require 'rails/all'
require 'rspec'
require 'rspec/autorun'
require 'simplecov'
require 'ama_validators'
require 'coveralls'
Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start