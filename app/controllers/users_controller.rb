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
    valid_params = params.permit(:name, :email, :password, :password_confirmation)
    @user = User.new(valid_params)

    if @user.save
      render "users/show"
    else
      render errors_as_json(@user)
    end
  end

  # PATCH/PUT /users/:id
  def update
    valid_params = params.permit(:name, :email, :password, :password_confirmation)

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
