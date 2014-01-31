require 'factories/profiles.rb'

describe PhoneNumberFormatValidator do

  let(:subject) { PhoneNumberFormatValidator }

  let( :attribute ) { :phone_number }
  let (:object) { Profile.new }

  invalid_phone_numbers = %w[123 780123456 1234456 666 mynumber]
  valid_phone_numbers = %w[587-555-5555 5875555555 1234567890 780myphone]

  context 'Wrong phone number format' do

    context 'No message is sent on the options' do
      it 'it returns error message expecified on the validator' do
        n  = subject.new( { attributes: attribute } )
        invalid_phone_numbers.each do |invalid_phone_number|
          expect(n.validate_each(object, attribute, invalid_phone_number)).to include('enter a valid 10-digit number (e.g. 587-555-5555)')
        end
      end
    end

    context 'Message is sent on the options' do
      it 'it returns error message expecified on the options' do
        n  = subject.new( { message: 'Test error message', attributes: attribute } )
        invalid_phone_numbers.each do |invalid_phone_number|
          expect(n.validate_each(object, attribute, invalid_phone_number)).to include('Test error message')
        end
      end
    end

  end

  context 'Correct phone number format' do

    context 'No message is sent on the options' do
      it 'it does not return error message' do
        n  = subject.new( { attributes: attribute } )
        valid_phone_numbers.each do |valid_phone_number|
          expect(n.validate_each(object, attribute, valid_phone_number)).to equal(nil)
        end
      end
    end

    context 'Message is sent on the options' do
      it 'it does not return error message' do
        n  = subject.new( { message: 'Test error message', attributes: attribute } )
        valid_phone_numbers.each do |valid_phone_number|
          expect(n.validate_each(object, attribute, valid_phone_number)).to equal(nil)
        end
      end
    end

  end

end