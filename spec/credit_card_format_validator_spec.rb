require 'factories/profiles.rb'

describe CreditCardFormatValidator do

  let(:subject) { CreditCardFormatValidator }

  let( :attribute ) { :credit_card }
  let (:object) { Profile.new }

  invalid_credit_card_numbers = %w[9556494038121161 41128109359983 n396092084242542 535299462783972 1396092084242542]
  valid_credit_card_numbers = %w[4556494038121161 4112810935509983 4556828677360012 5396092084242542 5180466231664941 5352994627083972]


  context 'Wrong credit card format' do

    context 'No message is sent on the options' do
      it 'it returns error message expecified on the validator' do
        n  = subject.new( { attributes: attribute } )
        invalid_credit_card_numbers.each do |invalid_credit_card_number|
          expect(n.validate_each(object, attribute, invalid_credit_card_number)).to include('enter a valid credit card number (Visa or Mastercard)')
        end
      end
    end

    context 'Message is sent on the options' do
      it 'it returns error message expecified on the options' do
        n  = subject.new( { message: 'Test error message', attributes: :postal_code } )
        invalid_credit_card_numbers.each do |invalid_credit_card_number|
          expect(n.validate_each(object, attribute, invalid_credit_card_number)).to include('Test error message')
        end
      end
    end

  end

  context 'Correct credit card format' do

    context 'No message is sent on the options' do
      it 'it does not return error message' do
        n  = subject.new( { attributes: attribute } )
        valid_credit_card_numbers.each do |valid_credit_card_number|
          expect(n.validate_each(object, attribute, valid_credit_card_number)).to equal(nil)
        end
      end
    end

    context 'Message is sent on the options' do
      it 'it does not return error message' do
        n  = subject.new( { message: 'Test error message', attributes: attribute } )
        valid_credit_card_numbers.each do |valid_credit_card_number|
          expect(n.validate_each(object, attribute, valid_credit_card_number)).to equal(nil)
        end
      end
    end

  end

end