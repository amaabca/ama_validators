require 'factories/Profiles.rb'

describe EmailFormatValidator do

  let(:subject) { EmailFormatValidator }

  let( :attribute ) { :email }
  let (:object) { Profile.new }


  context 'Wrong email format' do

    context 'No message is sent on the options' do
      it 'it returns error message expecified on the validator' do
        n  = subject.new( { attributes: attribute } )
        expect(n.validate_each(object, attribute, 'fail@com')).to include('enter a valid email address (e.g. name@example.com)')
      end
    end

    context 'Message is sent on the options' do
      it 'it returns error message expecified on the options' do
        n  = subject.new( { message: 'Test error message', attributes: :postal_code } )
        expect(n.validate_each(object, attribute, 'fail.com')).to include('Test error message')
      end
    end

  end

  context 'Correct email format' do

    context 'No message is sent on the options' do
      it 'it do not return error message' do
        n  = subject.new( { attributes: attribute } )
        expect(n.validate_each(object, attribute, 'no_fail@mail.com')).to equal(nil)
      end
    end

    context 'Message is sent on the options' do
      it 'it do not return error message' do
        n  = subject.new( { message: 'Test error message', attributes: attribute } )
        expect(n.validate_each(object, attribute, 'no_fail@mail.com')).to equal(nil)
      end
    end

  end

end