module UserHelpers
  def sign_in user=double('User')
    controller.stub current_user: user
  end
end

RSpec.configure do |config|
  config.include UserHelpers, type: :controller
end
