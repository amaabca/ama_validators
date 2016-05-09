class MembershipNumberFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /\A(620272)(\d){10}\z/
      object.errors[attribute] << (options[:message] || "must be a valid 16-digit membership number")
    end
  end
end