require 'rails_helper'

RSpec.describe Offer, type: :model do
  subject { create(:offer) }

  it 'has a valid factory' do
    expect(FactoryBot.create(:offer)).to be_valid
  end 

  context 'validations' do
    it { is_expected.to validate_presence_of :code }
    it { is_expected.to validate_uniqueness_of :code }

    it { is_expected.to validate_presence_of :version }
    it { is_expected.to validate_presence_of :publication_date }
  end

  context 'associations' do
   it { should have_many(:products) }
 end
end
