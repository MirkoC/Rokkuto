class Api::ObjectsController < ApplicationController

  def show

  end

  def create

  end

  def delete

  end

  private
  def objects_params
    params.require(:object).permit(:api_key, :user_email, :content_type, :content_id)
  end
end
