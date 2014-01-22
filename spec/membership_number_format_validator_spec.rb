require 'factories/profiles.rb'

describe MembershipNumberFormatValidator do

  let(:subject) { MembershipNumberFormatValidator }

  let( :attribute ) { :membership_number }
  let (:object) { Profile.new }


  context 'Wrong membership number format' do

    context 'No message is sent on the options' do
      it 'it returns error message expecified on the validator' do
        n  = subject.new( { attributes: attribute } )
        expect(n.validate_each(object, attribute, '6202721111')).to include('must be a valid membership number')
      end
    end

    context 'Message is sent on the options' do
      it 'it returns error message expecified on the options' do
        n  = subject.new( { message: 'Test error message', attributes: :postal_code } )
        expect(n.validate_each(object, attribute, '6202721111')).to include('Test error message')
      end
    end

  end

  context 'Correct membership number format' do

    context 'No message is sent on the options' do
      it 'it do not return error message' do
        n  = subject.new( { attributes: attribute } )
        expect(n.validate_each(object, attribute, '6202720022820001')).to equal(nil)
      end
    end

    context 'Message is sent on the options' do
      it 'it do not return error message' do
        n  = subject.new( { message: 'Test error message', attributes: attribute } )
        expect(n.validate_each(object, attribute, '6202720022820001')).to equal(nil)
      end
    end

  end

end