class CustomFailure < Devise::FailureApp
  def respond
    if request.controller_class.to_s.start_with? 'Api::'
      json_api_error_response
    else
      super
    end
  end

  def json_api_error_response
    self.status        = :unauthorized
    self.content_type  = 'application/json'
    self.response_body = { errors: [{ status: '401', title: 'Unauthorized' }]}.to_json
  end
end