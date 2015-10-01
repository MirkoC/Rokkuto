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
    @user = User.find_by_email(params[:email])
    @user = User.create(email: params[:email],
                        token: SecureRandom.uuid) unless @user

    @auth_object = consume! AuthObject.new

    @auth_object.user_token = User.find_by_email(params[:email]).token
    @auth_object.application_id = @application.id
    @auth_object.token = SecureRandom.uuid

    @auth_object.save

    render json: @auth_object
  end

  def update
  end

  def delete
  end
end
