require 'factories/profiles.rb'

describe CreditCardFormatValidator do

  let(:subject) { CreditCardFormatValidator }

  let( :attribute ) { :credit_card }
  let (:object) { Profile.new }


  context 'Wrong credit card format' do

    context 'No message is sent on the options' do
      it 'it returns error message expecified on the validator' do
        n  = subject.new( { attributes: attribute } )
        expect(n.validate_each(object, attribute, '9485582751367890')).to include('enter a valid credit card number (Visa or Mastercard)')
      end
    end

    context 'Message is sent on the options' do
      it 'it returns error message expecified on the options' do
        n  = subject.new( { message: 'Test error message', attributes: :postal_code } )
        expect(n.validate_each(object, attribute, '9485582751367890')).to include('Test error message')
      end
    end

  end

  context 'Correct credit card format' do

    context 'No message is sent on the options' do
      it 'it do not return error message' do
        n  = subject.new( { attributes: attribute } )
        expect(n.validate_each(object, attribute, '4716157014589654')).to equal(nil)
      end
    end

    context 'Message is sent on the options' do
      it 'it do not return error message' do
        n  = subject.new( { message: 'Test error message', attributes: attribute } )
        expect(n.validate_each(object, attribute, '5595361193388663')).to equal(nil)
      end
    end

  end

end