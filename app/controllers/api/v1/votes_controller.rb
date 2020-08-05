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
    @vote = current_user.votes.new( vote: params[:vote], requirement_id: params[:requirement_id] )

    if @vote.save
      render json: @vote.as_json(:except => [:created_at, :updated_at]), status: :created
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /votes/1 : Edita un voto
  def update
    if @vote.update(vote: params[:vote])
      render json: @vote.as_json(:except => [:created_at, :updated_at])
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /votes/1 : Borra un voto
  def destroy
    @vote.destroy
  end

  # PUT /votes/requirement/:requirement_id : Crear y editar un voto
  def edit
    @vote = current_user.votes.find_by(requirement_id: params[:requirement_id]) ?
            current_user.votes.find_by(requirement_id: params[:requirement_id]) :
            current_user.votes.new( vote: params[:vote], requirement_id: params[:requirement_id] )
    if @vote.update(vote: params[:vote])
      render json: @vote.as_json(:except => [:created_at, :updated_at])
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      #@vote = Vote.find(params[:id])
      @vote = current_user.votes.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vote_params
      params.require(:vote).permit(:vote, :requirement_id)
    end
end
