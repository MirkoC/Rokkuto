class Api::V1::ApplicationController < ApplicationController
  include Roar::Rails::ControllerAdditions
  include Roar::Rails::ControllerAdditions::Render

  private

  def render_error(status)
    status = Rack::Utils.status_code(status) if status.is_a? Symbol
    render json: OpenStruct.new(error: status), represent_with: ErrorRepresenter, status: status
  end
end
