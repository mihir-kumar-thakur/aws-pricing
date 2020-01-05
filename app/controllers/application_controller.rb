class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_unprocessable_entity_response(exception)
    render json: {error: "We could not find AWS pricing for your query."}, status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    render json: { error: "We could not find AWS pricing for your query." }, status: :not_found
  end
end
