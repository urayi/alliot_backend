class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  respond_to :json
  
  # GET /comments : Lista todos los comentarios
  def index
    @comments = Comment.all

    render json: @comments.as_json(:except => [:created_at, :updated_at])
  end

  # GET /comments/1 : Muestra un comentario por id
  def show
    render json: @comment.as_json(:except => [:created_at, :updated_at])
  end

  # POST /comments : Crea un comentario asociado al usuario y el requerimiento
  def create
    @comment = current_user.comments.new( comment: params[:comment], requeriment_id: params[:requeriment_id])

    if @comment.save
      render json: @comment.as_json(:except => [:created_at, :updated_at]), status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1 : Edita un comentario
  def update
    if @comment.update(comment_params)
      render json: @comment.as_json(:except => [:created_at, :updated_at])
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1 : Borra un comentario
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:comment, :requeriment_id)
    end
end
