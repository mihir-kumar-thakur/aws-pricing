require 'rails_helper'

RSpec.describe Region, type: :model do
  subject { create(:region) }

  it 'has a valid factory' do
    expect(FactoryBot.create(:region)).to be_valid
  end 

  context 'validations' do
    it { is_expected.to validate_presence_of :code }
    it { is_expected.to validate_uniqueness_of :code }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end

  context 'associations' do
   it { should have_many(:products) }
 end
end
