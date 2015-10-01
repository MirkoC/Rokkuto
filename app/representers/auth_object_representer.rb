module AuthObjectRepresenter
  include Roar::JSON

  property :id
  property :permissions
  property :content_id
  property :content_type
  property :user_token
  property :application_id
  property :api_key, getter: :get_application_key, setter: nil
  property :token

  def get_application_key(_arg)
    Application.find_by_id(application_id).api_key
  end
end
