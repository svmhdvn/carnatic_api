class AuthenticatedController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
end