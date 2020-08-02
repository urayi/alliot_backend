class Api::V1::VotesController < ApplicationController
  before_action :set_vote, only: [:show, :update, :destroy]
  respond_to :json

  # GET /votes : Lista todos los votos
  def index
    @votes = Vote.all

    render json: @votes.as_json(:except => [:created_at, :updated_at])
  end

  # GET /votes/1 : Muestra un voto
  def show
    render json: @vote.as_json(:except => [:created_at, :updated_at])
  end

  # POST /votes : Crea un voto asociado al usuario y el requerimiento
  def create
    @vote = current_user.votes.new( vote: params[:vote], requeriment_id: params[:requeriment_id] )

    if @vote.save
      render json: @vote.as_json(:except => [:created_at, :updated_at]), status: :created
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /votes/1 : Edita un voto
  def update
    if @vote.update(vote_params)
      render json: @vote.as_json(:except => [:created_at, :updated_at])
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /votes/1 : Borra un voto
  def destroy
    @vote.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vote_params
      params.require(:vote).permit(:vote, :requeriment_id)
    end
end
