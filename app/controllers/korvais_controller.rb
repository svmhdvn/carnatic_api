class KorvaisController < AuthenticatedController
  before_action :authenticate_user, only: [:create, :update, :destroy]

  # GET /user/:user_id/korvais
  def index
    @korvais = User.find_by(id: params[:user_id]).korvais
    render "korvais/index"
  end

  # GET /korvais/:id
  def show
    @korvai = Korvai.find_by(id: params[:id])
    render "korvais/show"
  end

  # POST /korvais
  def create
    valid_params = params.permit(:content, :thalam, :matras_after)
    @korvai = current_user.korvais.new(valid_params)

    if @korvai.save
      render "korvais/show"
    else
      render errors_as_json(@korvai)
    end
  end

  # PATCH/PUT /korvais/:id
  def update
    korvai = current_user.korvais.find_by(id: params[:id])
    valid_params = params.permit(:content, :thalam, :matras_after)

    if korvai.update(valid_params)
      head :no_content
    else
      render errors_as_json(korvai)
    end
  end

  # DELETE /korvais/:id
  def destroy
    current_user.korvais.find_by(id: params[:id]).destroy
    head :no_content
  end
end
