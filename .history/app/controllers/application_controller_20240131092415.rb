class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
        include AbstractController::Layouts
        # skip_before_action :verify_authenticity_token
        before_action :log_request_headers
    def test_route
      if current_user
        render json: { message: "Authenticated as #{current_user.email}" }
      else
        render json: { message: "Not authenticated" }, status: :unauthorized
      end
      end

  private

  def log_request_headers
    Rails.logger.info "Headers: #{request.headers.to_h.select { |k, v| k.include?('HTTP') }}"
  end

end
