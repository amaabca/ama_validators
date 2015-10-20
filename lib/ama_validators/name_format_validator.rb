class NameFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /\A[a-zA-Z,.'-]+\z/
      object.errors[attribute] << (options[:message] || "We're sorry your name cannot contain any special characters")
    end
  end
end
