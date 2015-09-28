class ApplicationsController < ApplicationController

  def index
  end

  def show
    @application = Application.find_by_id(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(applications_params.merge(:api_key => SecureRandom.hex(16)))
    if @application.save
      redirect_to @application
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def applications_params
    params.require(:application).permit(:name)
  end
end
