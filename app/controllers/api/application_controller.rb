class Api::ApplicationController < ApplicationController
  include Roar::Rails::ControllerAdditions
  include Roar::Rails::ControllerAdditions::Render

  private
  def render_error(status)
    if status.is_a? Symbol
      status = Rack::Utils.status_code(status)
    end
    render json: OpenStruct.new({error: status}), represent_with: ErrorRepresenter, status: status
  end
end
