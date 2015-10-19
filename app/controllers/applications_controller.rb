class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find_by_id(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(applications_params
                                       .merge(api_key: SecureRandom.hex(16)))
    if @application.save
      redirect_to @application
    else
      render :new
    end
  end

  def edit
    @application = Application.find_by_id(params[:id])
  end

  def update
    @application = Application.update(applications_params)
    if @application.save
      redirect_to @application
    else
      render :show
    end
  end

  def destroy
    @application = Application.find_by_id(params[:id])
    if @application.destroy
      render :show
    else
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end

  private

  def applications_params
    params.require(:application).permit(:name, :domain)
  end
end
