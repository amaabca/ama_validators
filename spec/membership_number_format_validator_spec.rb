require 'factories/profiles.rb'

describe MembershipNumberFormatValidator do

  let(:subject) { MembershipNumberFormatValidator }

  let( :attribute ) { :membership_number }
  let (:object) { Profile.new }

  invalid_membership_numbers = %w[waffles 1234560022820001 620272089641001 62027217054490012 1202722030577003 6202822030577003]
  valid_membership_numbers = %w[6202720022820001 6202720896410004 6202721705449001 6202722030577003]


  context 'Wrong membership number format' do

    context 'No message is sent on the options' do
      it 'it returns error message expecified on the validator' do
        n  = subject.new( { attributes: attribute } )
        invalid_membership_numbers.each do |invalid_membership_number|
          expect(n.validate_each(object, attribute, invalid_membership_number)).to include('must be a valid 16-digit membership number')
        end
      end
    end

    context 'Message is sent on the options' do
      it 'it returns error message expecified on the options' do
        n  = subject.new( { message: 'Test error message', attributes: :postal_code } )
        invalid_membership_numbers.each do |invalid_membership_number|
          expect(n.validate_each(object, attribute, invalid_membership_number)).to include('Test error message')
        end
      end
    end

  end

  context 'Correct membership number format' do

    context 'No message is sent on the options' do
      it 'it does not return error message' do
        n  = subject.new( { attributes: attribute } )
        valid_membership_numbers.each do |valid_membership_number|
          expect(n.validate_each(object, attribute, valid_membership_number)).to equal(nil)
        end
      end
    end

    context 'Message is sent on the options' do
      it 'it does not return error message' do
        n  = subject.new( { message: 'Test error message', attributes: attribute } )
        valid_membership_numbers.each do |valid_membership_number|
          expect(n.validate_each(object, attribute, valid_membership_number)).to equal(nil)
        end
      end
    end

  end

end