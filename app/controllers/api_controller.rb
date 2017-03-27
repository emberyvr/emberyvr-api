class ApiController < ApplicationController
  include JSONAPI::ActsAsResourceController
  include Pundit
  protect_from_forgery with: :null_session

  before_filter :require_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

private
  def context
    {user: current_user}
  end

  def user_not_authorized
    head :forbidden
  end
end
