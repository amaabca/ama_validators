require 'factories/profiles.rb'

describe PostalCodeFormatValidator do

  let(:subject) { PostalCodeFormatValidator }

  let( :attribute ) { :postal_code }
  let (:object) { Profile.new }

  invalid_postal_codes = %w[2w2e3e b4hk6j t556v7 x2ceee t3x6sv T5j5M/ 123456]
  valid_postal_codes = %w[T5w4g5 T5W4G5 X4H3J9 t6J4M5 x3B5X8 12345 12345-6789]

  context 'Wrong postal code format' do

    context 'No message is sent on the options' do
      it 'it returns error message expecified on the validator' do
        n  = subject.new( { attributes: attribute } )
        invalid_postal_codes.each do |invalid_postal_code|
          expect(n.validate_each(object, attribute, invalid_postal_code)).to include('enter a valid AB or NT postal code (e.g. T4C 1A5)')
        end
      end
    end

    context 'Message is sent on the options' do
      it 'it returns error message expecified on the options' do
        n  = subject.new( { message: 'Test error message', attributes: attribute } )
        invalid_postal_codes.each do |invalid_postal_code|
          expect(n.validate_each(object, attribute, invalid_postal_code)).to include('Test error message')
        end
      end
    end

  end

  context 'Correct postal code format' do

    context 'No message is sent on the options' do
      it 'it does not return error message' do
        n  = subject.new( { attributes: attribute } )
        valid_postal_codes.each do |valid_postal_code|
          expect(n.validate_each(object, attribute, valid_postal_code)).to equal(nil)
        end
      end
    end

    context 'Message is sent on the options' do
      it 'it does not return error message' do
        n  = subject.new( { message: 'Test error message', attributes: attribute } )
        valid_postal_codes.each do |valid_postal_code|
          expect(n.validate_each(object, attribute, valid_postal_code)).to equal(nil)
        end
      end
    end

  end

end