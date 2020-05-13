class AuthenticationController < ApplicationController
  before_action :authorize_request, except: [:signup, :login]

  # POST /auth/login
  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"), email: params[:email]}, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def signup
    @user = User.new(signup_params)
    if @user.save
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"), email: params[:email]}, status: :ok
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def user
    user = {
      name: @current_user.name,
      email: @current_user.email,
    }
    render json: { user: user }, status: :ok
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def signup_params
    params.permit(
      :name, :email, :password, :password_confirmation
    )
  end
end
