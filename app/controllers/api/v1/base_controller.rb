module Api
  module V1
    class BaseController < ActionController::Base
      include JSONAPI::ActsAsResourceController
      include Pundit
    end
  end
end
