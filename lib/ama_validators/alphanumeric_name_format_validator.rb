class AlphanumericNameFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /\A[\s\da-zA-ZÀàÂâÄäÈèÉéÊêËëÎîÏïÔôŒœÙùÛûÜüŸÿÇç,.'\-\)\(]+\z/
      object.errors[attribute] << (options[:message] || "We're sorry your name cannot contain any special characters")
    end
  end
end
