class PostalCodeFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /\A(\d{5}((-|\s)\d{4})?)|([txTX]\d[abceghjklmnprstvwxyzABCEGHJKLMNPRSTVWXYZ])\ {0,1}(\d[abceghjklmnprstvwxyzABCEGHJKLMNPRSTVWXYZ]\d)\z/
      object.errors[attribute] << (options[:message] || "enter a valid AB or NT postal code (e.g. T2T 2T2)")
    end
  end
end

