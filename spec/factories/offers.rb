FactoryBot.define do
  factory :offer do
    code { 'AmazonCloudFront' }
    version { '20191219230750' }
    publication_date { DateTime.parse("2019-12-19 23:07:50") }
  end
end
