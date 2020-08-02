class Api::V1::RequerimentsController < ApplicationController
  before_action :set_requeriment, only: [:show, :update, :destroy]

  # GET /requeriments
  def index
    @requeriments = Requeriment.all

    render json: @requeriments
  end

  # GET /requeriments/1
  def show
    render json: @requeriment
  end

  # POST /requeriments
  def create
    @requeriment = Requeriment.new(requeriment_params)

    if @requeriment.save
      render json: @requeriment, status: :created, location: @requeriment
    else
      render json: @requeriment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requeriments/1
  def update
    if @requeriment.update(requeriment_params)
      render json: @requeriment
    else
      render json: @requeriment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requeriments/1
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
      params.require(:requeriment).permit(:title, :content, :user_id)
    end

end
