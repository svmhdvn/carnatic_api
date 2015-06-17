class ApplicationController < ActionController::API
  before_action :set_default_response_format
  
  private

    def set_default_response_format
      request.format = :json
    end
    
  protected

    def errors_as_json(model)
      { json: { errors: model.errors.full_messages }, status: :unprocessable_entity }
    end
end
