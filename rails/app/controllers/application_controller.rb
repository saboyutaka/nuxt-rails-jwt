class ApplicationController < ActionController::API
  def authorize_request
    header = request.headers['Authorization']
    if header
      token = header.split(' ').last
    else
      return render json: { errors: 'Authorization is not given.' }, status: :unauthorized
    end

    begin
      @decoded = JsonWebToken.decode(token)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
