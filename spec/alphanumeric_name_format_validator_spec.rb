require 'factories/profiles.rb'

describe AlphanumericNameFormatValidator do

  let(:subject) { AlphanumericNameFormatValidator }
  let (:object) { Profile.new }

  invalid_names = %w[A%^dam G∫ Ra©©øøl œ∑´®††a †††¬∆µ ©ƒ∂ßåΩ ≈ç√∫µ@]
  valid_names = %w[George Jerry Elaine Kramer Jean-François Noël étè 1234567890 Ltd.]

  context 'Wrong name format' do
    context 'No message is sent on the options' do
      it 'it returns error message expecified on the validator' do
        n  = subject.new( { attributes: :first_name } )
        invalid_names.each do |invalid_name|
          expect(n.validate_each(object, :first_name, invalid_name)).to include("We're sorry your name cannot contain any special characters")
        end
      end
    end

    context 'Message is sent on the options' do
      it 'it returns error message expecified on the options' do
        n  = subject.new( { message: 'Test error message', attributes: :first_name } )
        invalid_names.each do |invalid_name|
          expect(n.validate_each(object, :first_name, invalid_name)).to include('Test error message')
        end
      end
    end
  end

  context 'Correct name format' do

    context 'No message is sent on the options' do
      it 'it does not return error message' do
        n  = subject.new( { attributes: :first_name } )
        valid_names.each do |valid_name|
          expect(n.validate_each(object, :first_name, valid_name)).to equal(nil)
        end
      end
    end

    context 'Message is sent on the options' do
      it 'it does not return error message' do
        n  = subject.new( { message: 'Test error message', attributes: :first_name } )
        valid_names.each do |valid_name|
          expect(n.validate_each(object, :first_name, valid_name)).to equal(nil)
        end
      end
    end
  end
end
