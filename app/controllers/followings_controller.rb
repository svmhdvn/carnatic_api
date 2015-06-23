class FollowingsController < AuthenticatedController
  before_action :authenticate_user, only: [:create, :destroy]

  # GET /users/:user_id/followers
  def followers
    @followings = User.find_by(id: params[:user_id]).followers
    render "followings/index"
  end

  # GET /users/:user_id/followings
  def followings
    @followings = User.find_by(id: params[:user_id]).followings
    render "followings/index"
  end

  # POST /followings/:followee_id
  def create
    current_user.followings.create(followee_id: params[:followee_id])
    head :no_content
  end

  # DELETE /followings/:followee_id
  def destroy
    current_user.followings.find_by(followee_id: params[:followee_id])
    head :no_content
  end
end
