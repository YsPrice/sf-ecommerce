class ApplicationController < ActionController::Base
        # include DeviseTokenAuth::Concerns::SetUserByToken
        skip_before_action :verify_authenticity_token
        before_action :log_request_headers
    def test_route
        render plain: 'Test Route Accessed'
      end

  private

  def log_request_headers
    Rails.logger.info "Headers: #{request.headers.to_h.select { |k, v| k.include?('HTTP') }}"
  end

end
