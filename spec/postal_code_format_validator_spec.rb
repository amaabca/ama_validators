require 'factories/Profiles.rb'

describe PostalCodeFormatValidator do

  let(:subject) { PostalCodeFormatValidator }

  let( :attribute ) { :postal_code }
  let (:object) { Profile.new }


  context 'Wrong postal code format' do

    context 'No message is sent on the options' do
      it 'it returns error message expecified on the validator' do
        n  = subject.new( { attributes: attribute } )
        expect(n.validate_each(object, attribute, 'TTJ4M5')).to include('enter a valid AB or NT postal code (e.g. T2T 2T2)')
      end
    end

    context 'Message is sent on the options' do
      it 'it returns error message expecified on the options' do
        n  = subject.new( { message: 'Test error message', attributes: attribute } )
        expect(n.validate_each(object, attribute, 'G7J4M5')).to include('Test error message')
      end
    end

  end

  context 'Correct postal code format' do

    context 'No message is sent on the options' do
      it 'it do not return error message' do
        n  = subject.new( { attributes: attribute } )
        expect(n.validate_each(object, attribute, 'T6J4M5')).to equal(nil)
      end
    end

    context 'Message is sent on the options' do
      it 'it do not return error message' do
        n  = subject.new( { message: 'Test error message', attributes: attribute } )
        expect(n.validate_each(object, attribute, 'T6J4M5')).to equal(nil)
      end
    end

  end

end