require "ama_validators/version"

module AmaValidators

  require 'ama_validators/postal_code_format_validator'
  require 'ama_validators/email_format_validator'
  require 'ama_validators/credit_card_format_validator'
  require 'ama_validators/membership_number_format_validator'
  require 'ama_validators/phone_number_format_validator'
  require 'ama_validators/province_validator'

  module Rails
    class Engine < ::Rails::Engine
    end
  end
end
