class CreditCardFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /((4\d{3})|(5[1-5]\d{2})|(6011)|(34\d{1})|(37\d{1}))-?\d{4}-?\d{4}-?\d{4}|3[4,7][\d\s-]{15}/
      object.errors[attribute] << (options[:message] || "enter a valid credit card number (Visa or Mastercard)")
    end
  end
end