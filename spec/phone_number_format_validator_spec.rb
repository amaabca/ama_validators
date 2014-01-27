require 'factories/Profiles.rb'

describe PhoneNumberFormatValidator do

  let(:subject) { PhoneNumberFormatValidator }

  let( :attribute ) { :phone_number }
  let (:object) { Profile.new }


  context 'Wrong phone number format' do

    context 'No message is sent on the options' do
      it 'it returns error message expecified on the validator' do
        n  = subject.new( { attributes: attribute } )
        expect(n.validate_each(object, attribute, '777 777')).to include('enter a valid 10-digit number (e.g. 587-555-5555)')
      end
    end

    context 'Message is sent on the options' do
      it 'it returns error message expecified on the options' do
        n  = subject.new( { message: 'Test error message', attributes: attribute } )
        expect(n.validate_each(object, attribute, '777 777')).to include('Test error message')
      end
    end

  end

  context 'Correct phone number format' do

    context 'No message is sent on the options' do
      it 'it do not return error message' do
        n  = subject.new( { attributes: attribute } )
        expect(n.validate_each(object, attribute, '777 123 4567')).to equal(nil)
      end
    end

    context 'Message is sent on the options' do
      it 'it do not return error message' do
        n  = subject.new( { message: 'Test error message', attributes: attribute } )
        expect(n.validate_each(object, attribute, '777 123 4567')).to equal(nil)
      end
    end

  end

end