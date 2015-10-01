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
    @application = Application.find_by_api_key(params[:api_key])
    @user = User.find_by_email(params[:email])
    @auth_object = AuthObject.where(content_id: params[:content_id],
                                    content_type: params[:content_type],
                                    application_id: @application.id,
                                    user_token: @user.token)
    to = params[:to].split(',')
    permissions = params[:permissions].split(',')
    @auth_objects ||= []
    to.each_with_index do |to, index|
      user = User.find_by_email(to.strip)
      user = User.create(email: to.strip,
                         token: SecureRandom.uuid) unless user
      auth_object = AuthObject.new(content_type: params[:content_type],
                                   content_id: params[:content_id],
                                   user_token: user.token,
                                   permissions: permissions[index].strip,
                                   application_id: @application.id,
                                   token: SecureRandom.uuid)
      auth_object.save
      # TODO: from here send email
      @auth_objects.push(auth_object)
    end
    render json: @auth_objects
  end
end
