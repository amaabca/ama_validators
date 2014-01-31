require 'factories/profiles.rb'

describe EmailFormatValidator do

  let(:subject) { EmailFormatValidator }

  let( :attribute ) { :email }
  let (:object) { Profile.new }

  invalid_addresses = %w[user@fail,com user_at.com user_fail.com user@ @fail.com ryan`1`@system88.com]
  valid_addresses = %w[user@pass.com user_user@pass.com user.user@pass.com ryan+stage@systme88.com]


  context 'Wrong email format' do

    context 'No message is sent on the options' do
      it 'it returns error message expecified on the validator' do
        n  = subject.new( { attributes: attribute } )
        invalid_addresses.each do |invalid_address|
          expect(n.validate_each(object, attribute, invalid_address)).to include('enter a valid email address (e.g. name@example.com)')
        end
      end
    end

    context 'Message is sent on the options' do
      it 'it returns error message expecified on the options' do
        n  = subject.new( { message: 'Test error message', attributes: :postal_code } )
        invalid_addresses.each do |invalid_address|
          expect(n.validate_each(object, attribute, invalid_address)).to include('Test error message')
        end
      end
    end

  end

  context 'Correct email format' do

    context 'No message is sent on the options' do
      it 'it does not return error message' do
        n  = subject.new( { attributes: attribute } )
        valid_addresses.each do |valid_address|
          expect(n.validate_each(object, attribute, valid_address)).to equal(nil)
        end
      end
    end

    context 'Message is sent on the options' do
      it 'it does not return error message' do
        n  = subject.new( { message: 'Test error message', attributes: attribute } )
        valid_addresses.each do |valid_address|
          expect(n.validate_each(object, attribute, valid_address)).to equal(nil)
        end
      end
    end

  end

end