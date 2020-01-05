require 'rails_helper'

RSpec.describe PricingsController, type: :controller do
  context 'GET #index' do 
   it 'should success and render to price json data' do
      get :index, params: { offer_code: 'AmazonCloudFront', region_code: 'us-east-1' }
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
   end
  end
end
