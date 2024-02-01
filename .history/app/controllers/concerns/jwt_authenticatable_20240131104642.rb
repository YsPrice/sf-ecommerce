

  module JwtAuthenticatable
    extend ActiveSupport::Concern
  
    included do
      before_action :authenticate_user!
    end
  
    private
  
   
  def authenticate_user!
    render json: {message: 'auth accessed'}
  end
end

    #   token = request.headers['Authorization']&.split(' ')&.last
  #   if token
  #     begin
  #       decoded_token = JWT.decode(token, ENV['DEVISE_JWT_SECRET_KEY'], true, { algorithm: 'HS256' })
  #       @current_user = User.find(decoded_token[0]['user_id'])
  #     rescue JWT::DecodeError
  #       render json: { error: 'Invalid token' }, status: :unauthorized
  #     end
  #   else
  #     render json: { error: 'Token not present' }, status: :unauthorized
  #   end
  # end