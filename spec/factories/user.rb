FactoryGirl.define do
  factory :user do
    email 'me@example.org'
    token SecureRandom.uuid
  end
end