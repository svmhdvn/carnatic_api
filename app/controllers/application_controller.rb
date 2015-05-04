class ApplicationController < ActionController::API
  protected

    def errors_as_json(model)
      { json: { errors: model.errors.full_messages }, status: :unprocessable_entity }
    end
end
