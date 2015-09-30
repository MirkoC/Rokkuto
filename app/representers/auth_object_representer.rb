module AuthObjectRepresenter
  include Roar::JSON

  property :id
  property :api_key
  property :permissions
  property :content_id
  property :content_type
  property :user_token, setter:
                          ->(_val, args) { self.user_token = args[:user].token }
end
