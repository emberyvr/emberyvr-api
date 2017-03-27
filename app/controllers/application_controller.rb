class ApplicationController < ActionController::Base
  helper_method :current_user

private
  # Load the current user from the database if present
  def current_user
    @current_user ||= user_from_session || user_from_token
  end

  def user_from_session
    return nil unless session[:current_user_id]
    User.find(session[:current_user_id])
  end

  def user_from_token
    email = request.headers['X-User-Email']
    token = request.headers['X-User-Token']
    return nil unless email && token
    User.where(email: email, authentication_token: token).first
  end

  def sign_in(user, password)
    raise "Can't sign in without a user" if user.blank?
    reset_session

    if user.authenticate(password) || (Rails.env.development? && ENV['AUTHENTICATE_USERS'].blank?)
      session[:current_user_id] = user.id
    end
  end

  def find_user_by_email(email)
    @user = User.find_by email: email
    render json: {errors: ["Couldn't find a user by that email address"]}, status: :not_found and return if @user.blank?
  end

  def signed_in?
    current_user.present?
  end

  def is_admin?
    signed_in? && current_user.role == 'admin'
  end

  # before filter for ensuring a user is present
  def require_user
    render_unauthorized unless signed_in?
  end

  # helper to render unauthorized response
  def render_unauthorized
    render json: { errors: ['Unauthorized'] }, status: 401 and return
  end

  def check_if_owner
    raise "You can't modify this" if !can_update?
  end
end
