class UsersController < AuthenticatedController
  before_action :authenticate_user, only: [:update, :destroy]

  # POST /users/login
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      render "users/show"
    else
      render json: { errors: "Invalid username/password" }, status: 401
    end
  end

  # POST /users
  def create
    require 'digest/md5'

    valid_params = params.permit(:email, :password, :password_confirmation)
    @user = User.new(valid_params)

    if @user.save
      Profile.create(
        user: @user,
        name: params[:name], 
        picture_url: "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(params[:email])}?d=mm"
      )
      render "users/show"
    else
      render errors_as_json(@user)
    end
  end

  # PATCH/PUT /users/:id
  def update
    valid_params = params.permit(:email, :password, :password_confirmation)

    if @user.update(valid_params)
      head :no_content
    else
      render errors_as_json(@user)
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end
end
