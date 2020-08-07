class SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if current_user
      render json: { user: resource, token: request.env['warden-jwt_auth.token'] }, :except => [:jti, :created_at, :updated_at]
    else
      render json: { errors: [{ status: '400', title: 'Bad Request' }]}.to_json,  status: :bad_request
    end
  end

  def respond_to_on_destroy
    head :no_content
  end

end
