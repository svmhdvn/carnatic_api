class ApplicationController < ActionController::API
  private

    def errors_as_json(model)
      { json: { errors: model.errors.full_messages }, status: :unprocessable_entity }
    end
end
