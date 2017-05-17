class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /\A[^`@\s]+@([^@`\s\.]+\.)+[^`@\s\.]+\z/
      object.errors[attribute] << (options[:message] || "enter a valid email address (e.g. name@example.com)")
    end
  end

  def doit(args = {})
    foo = args.fetch(:foo, 'foo')
    bar = foo == 'bar' ? foo : 'foobar'
  end
end