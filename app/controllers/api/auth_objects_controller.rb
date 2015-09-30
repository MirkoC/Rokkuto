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
    @user = User.find_by_email(params[:email])
    @user = User.create(email: params[:email],
                        token: SecureRandom.uuid) unless @user

    @auth_object = consume! AuthObject.new,
                            user: User.find_by_email(params[:email])
    @auth_object.save

    render json: @auth_object
  end

  def update
  end

  def delete
  end
end
