class Api::V1::CommentsController < ApplicationController
  respond_to :json

  # POST /comments : Crea un comentario asociado al usuario y el requerimiento
  def create
    @comment = current_user.comments.new( comment: params[:comment], requirement_id: params[:requirement_id])

    if @comment.save
      render json: @comment.as_json(:except => [:created_at, :updated_at]), status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # GET /comments/requirements/1: Lista comentarios de un requerimiento
  def list
    @comments = Comment.where(requirement_id: params[:requirement_id])
    render json: @comments.as_json(:except => [:created_at, :updated_at])
  end

  private
    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:comment, :requirement_id)
    end
end
