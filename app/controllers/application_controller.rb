class ApplicationController < ActionController::Base
  def render_create_error(message:, status:)
    error = { detail: message }
    render jsonapi_errors: error, status: status
  end
end
