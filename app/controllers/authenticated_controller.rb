class AuthenticatedController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  protected

    def authenticate_user
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        @user = User.find_by(auth_token: token)
      end
    end

    def render_unauthorized
      render json: { errors: "Unauthorized" }, status: 401
    end

    def current_user
      @user
    end
end