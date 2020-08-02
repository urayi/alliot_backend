class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    if resource.save
      render json: resource, status: :created, :except => [:jti, :created_at, :updated_at]
    else
      render json: { errors: [{ status: '400', title: 'Bad Request' }] }.to_json, status: :bad_request
    end
  end

end
