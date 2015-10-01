module AuthObjectRepresenter
  include Roar::JSON

  property :id
  property :permissions
  property :content_id
  property :content_type
  property :user_token
  property :application_id
  property :api_key, getter: :get_application, setter: nil
  property :token


  def get_application(arg)
    Application.find_by_id(self.application_id).api_key
  end
end