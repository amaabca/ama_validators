require 'spec_helper'

describe ProvinceValidator do
  class Validatable
    include ActiveModel::Validations
    include ActiveModel::Model
    attr_accessor :country, :province

    validates :province, province: { country: :country }
  end

  subject { Validatable.new({ country: country, province: province }) }

  context 'province is in selected country as a string' do
    let(:country) { 'canada' }
    let(:province) { 'Alberta' }

    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'province is in selected country' do
    let(:country) { :canada }
    let(:province) { 'Alberta' }

    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'province is not in selected country' do
    let(:country) { :canada }
    let(:province) { 'Alabama' }

    it 'is not valid' do
      expect(subject).to_not be_valid
      expect(subject.errors[:province]).to_not be_empty
    end
  end

  context 'province is blank' do
    let(:country) { :canada }
    let(:province) { '' }

    it 'is not valid' do
      expect(subject).to_not be_valid
      expect(subject.errors[:province]).to_not be_empty
    end
  end

  context 'province is nil' do
    let(:country) { :canada }
    let(:province) { nil }

    it 'is not valid' do
      expect(subject).to_not be_valid
      expect(subject.errors[:province]).to_not be_empty
    end
  end

  context 'country has no provinces' do
    context 'province not specified' do
      let(:country) { :mexico }
      let(:province) { nil }

      it 'is valid' do
        expect(subject).to be_valid
        expect(subject.errors[:province]).to be_empty
      end
    end
  end
end
