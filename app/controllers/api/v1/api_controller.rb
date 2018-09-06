class Api::V1::ApiController < ActionController::API
  before_action :authenticate_token!

  private
    def authenticate_token!
      payload = JsonWebToken.decode(auth_token)
      @current_user = User.find(payload["sub"])
      rescue JWT::ExpiredSignature
        render json: {errors: ["Auth token has expired"]}, status: :unauthorized
      rescue JWT::DecodeError
        render json: {errors: ["Invalid auth token"]}, status: :unauthorized
    end

    def auth_token
      @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
    end
end
