class Api::V1::RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :update, :destroy]
  respond_to :json
  
  # GET /requirements : Lista todos los requerimientos
  def index
    @requirements = Requirement.all.order(params[:order_list] ? params[:order_list] : 'created_at DESC').each do |requirement|
      requirement.rank = requirement.votes.where(vote: true).count - requirement.votes.where(vote: false).count
      requirement.save
    end
      render json: @requirements.as_json(:except => [:created_at, :updated_at])
  end

  # GET /requirements/1 : Muestra un requerimiento
  def show
    @requirement.rank = @requirement.votes.where(vote: true).count - @requirement.votes.where(vote: false).count
    @requirement.save
    render json: @requirement.as_json(:except => [:created_at, :updated_at])
  end

  # POST /requirements : Crea un requerimiento
  def create
    @requirement = current_user.requirements.new(requirement_params)

    if @requirement.save
      render json: @requirement.as_json(:except => [:created_at, :updated_at]), status: :created
    else
      render json: @requirement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requirements/1 : Edita un requerimiento
  def update
    if @requirement.update(requirement_params)
      render json: @requirement.as_json(:except => [:created_at, :updated_at])
    else
      render json: @requirement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requirements/1 : Borra un requerimiento
  def destroy
    @requirement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requirement
      @requirement = Requirement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def requirement_params
      params.require(:requirement).permit(:title, :content, :order_list)
    end

end
