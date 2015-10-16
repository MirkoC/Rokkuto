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
  property :domain, getter: :get_application_domain, setter: nil

  def get_application_key(_arg)
    @application = Application.find_by_id(application_id)
    @application.api_key
  end

  def get_application_domain(_arg)
    @application.domain
  end
end
