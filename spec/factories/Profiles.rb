class Profile
  # Required dependency for ActiveModel::Errors
  extend ActiveModel::Naming

  def initialize
    @errors = ActiveModel::Errors.new(self)
  end

  attr_reader   :errors

  # The following methods are needed to be minimally implemented

  def read_attribute_for_validation(attr)
    send(attr)
  end

  def Profile.human_attribute_name(attr, options = {})
    attr
  end

  def Profile.lookup_ancestors
    [self]
  end
end