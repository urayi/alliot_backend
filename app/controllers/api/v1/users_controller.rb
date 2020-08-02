class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  respond_to :json
  
  # GET /users : Listo todos los usuarios
  def index
    @users = User.all

    render json: @users.as_json(:except => [:jti, :created_at, :updated_at])
  end

  # GET /users/1 : Muestra un usuario
  def show
    render json: @user.as_json(:except => [:jti, :created_at, :updated_at])
  end

  # PATCH/PUT /users/1 : Edita un usuario
  def update
    if @user.update(user_params)
      render json: @user.as_json(:except => [:jti, :created_at, :updated_at])
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 : Borra un usuario
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :name)
    end

end
