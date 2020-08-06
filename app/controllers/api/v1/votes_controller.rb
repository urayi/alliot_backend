class Api::V1::VotesController < ApplicationController
  before_action :set_vote, only: [:show, :update, :destroy]
  respond_to :json

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
    # Only allow a trusted parameter "white list" through.
    def vote_params
      params.require(:vote).permit(:vote, :requirement_id)
    end
end
