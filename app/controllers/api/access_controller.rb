class Api::AccessController < Api::ApplicationController
  represents :json, entity: AuthObjectRepresenter,
                    collection: AuthObjectCollectionRepresenter

  def show
    @application = Application.find_by_api_key(params[:api_key])
    @auth_object = AuthObject.find_by_token(params[:id])

    if @application && @auth_object
      render json: @auth_object
    else
      render_error :not_found
    end
  end

  def create
    prerequisites
    @application && @user && @auth_object ? save_auth_objects_and_send_response : (render_error :not_found)
  end

  private

  def save_auth_objects_and_send_response
    @auth_objects = store_auth_objects(params[:to])
    if @auth_objects
      # TODO AccessMailer.neki_mail(objekti).deliver_later
      render json: @auth_objects
    else
      render_error :not_acceptable
    end
  end

  def prerequisites
    @application = Application.find_by_api_key(params[:api_key])
    @user = User.find_by_email(params[:email])
    @auth_object = AuthObject.where(find_auth_object_params).first
  end

  def store_auth_objects(to)
    flag = true
    auth_objects ||= []
    AuthObject.transaction do
      auth_objects = to.map do |key_email, val_perm|
        user = User.find_or_create_by(email: key_email, token: SecureRandom.uuid)
        auth_object = AuthObject.new(create_auth_object_params(user, val_perm))
        flag &&= auth_object.save
      end
    end
    flag ? auth_objects : flag
  end

  def find_auth_object_params
    { content_id: params[:content_id],
      content_type: params[:content_type],
      application_id: @application.id,
      user_token: @user.token }
  end

  def create_auth_object_params(user, permission)
    { content_type: params[:content_type],
      content_id: params[:content_id],
      user_token: user.token,
      permissions: permission.strip,
      application_id: @application.id,
      token: SecureRandom.uuid }
  end
end
