require 'rails_helper'

RSpec.describe PricingsController, type: :controller do
  context 'GET #index' do 
   let(:region) { create(:region) }
   let(:offer) { create(:offer) }
   it 'should success and render to price json data' do
      get :index, params: { offer_code: offer.code, region_code: region.code }
      expect(response.code).to eq("200")
   end
  end
end
