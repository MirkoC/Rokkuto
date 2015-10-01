class Api::AuthObjectsController < Api::ApplicationController
  represents :json, entity: AuthObjectRepresenter,
                    collection: AuthObjectCollectionRepresenter

  def index
    @auth_objects = AuthObject.all
    render json: @auth_objects
  end

  def show
    @auth_object = AuthObject.find_by_id(params[:id])
    render json: @auth_object
  end

  def create
    @application = Application.find_by_api_key(params[:api_key])
    render_error :not_found unless @application
    @user = User.find_or_create_by(email: params[:email], token: SecureRandom.uuid)
    @auth_object = consume! AuthObject.new
    set_auth_object_non_consumable_params

    @auth_object.save ? (render json: @auth_object) : (render_error :not_acceptable)
  end

  def update
  end

  def delete
  end

  private

  def set_auth_object_non_consumable_params
    @auth_object.user_token = @user.token
    @auth_object.application_id = @application.id
    @auth_object.token = SecureRandom.uuid
  end
end
