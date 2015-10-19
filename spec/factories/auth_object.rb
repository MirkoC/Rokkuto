FactoryGirl.define do
  factory :auth_object do
    application_id '1'
    user_token SecureRandom.uuid
    content_id '7'
    content_type 'link'
    permissions 'rwx'
    token SecureRandom.uuid
  end
end