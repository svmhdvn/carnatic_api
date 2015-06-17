class ProfilesController < AuthenticatedController
  before_action :authenticate_user, only: [:update, :destroy]

  # GET /users/:user_id/profile
  def show
    @profile = User.find_by(id: params[:user_id]).profile
    render "profiles/show"
  end

  # PATCH/PUT /profiles
  def update
    profile = current_user.profile

    valid_params = params.permit(:name, :picture_url)

    if profile.update(valid_params)
      head :no_content
    else
      render errors_as_json(profile)
    end
  end

  # DELETE /profiles
  def destroy
    current_user.profile.destroy
    head :no_content
  end
end
