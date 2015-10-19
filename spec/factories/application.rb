FactoryGirl.define do
  factory :application do
    name 'test_app'
    api_key SecureRandom.hex(16)
    domain 'test_app.com'
  end
end