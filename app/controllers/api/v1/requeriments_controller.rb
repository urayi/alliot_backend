class Api::V1::RequerimentsController < ApplicationController
  before_action :set_requeriment, only: [:show, :update, :destroy]
  respond_to :json
  
  # GET /requeriments : Lista todos los requerimientos
  def index
    @requeriments = Requeriment.all

    render json: @requeriments.as_json(:except => [:created_at, :updated_at])
  end

  # GET /requeriments/1 : Muestra un requerimiento
  def show
    render json: @requeriment.as_json(:except => [:created_at, :updated_at])
  end

  # POST /requeriments : Crea un requerimiento
  def create
    @requeriment = current_user.requeriments.new(requeriment_params)

    if @requeriment.save
      render json: @requeriment.as_json(:except => [:created_at, :updated_at]), status: :created
    else
      render json: @requeriment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requeriments/1 : Edita un requerimiento
  def update
    if @requeriment.update(requeriment_params)
      render json: @requeriment.as_json(:except => [:created_at, :updated_at])
    else
      render json: @requeriment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requeriments/1 : Borra un requerimiento
  def destroy
    @requeriment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requeriment
      @requeriment = Requeriment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def requeriment_params
      params.require(:requeriment).permit(:title, :content)
    end

end
