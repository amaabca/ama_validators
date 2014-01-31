class PhoneNumberFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /\A(\+?1( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4})\z/
      object.errors[attribute] << (options[:message] || "enter a valid 10-digit number (e.g. 587-555-5555)")
    end
  end
end