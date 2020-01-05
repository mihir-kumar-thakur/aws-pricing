Rails.application.routes.draw do
  get "/service/:offer_code/region/:region_code", to: "pricings#index"
end
