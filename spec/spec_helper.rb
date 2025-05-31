require 'rails/all'
require 'rspec'
require 'simplecov'
require 'ama_validators'
require 'pry'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter
]
SimpleCov.start
