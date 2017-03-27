# stub respond_with and render nothing.
#
# this allows asserting that respond_with is called with mocks
# without causing errors about missing templates

module RespondWithHelper
  def expect_api_response object
    controller.should_receive(:respond_with)
      .with(:api, object) do
        controller.render json: nil
      end
  end
end

module JSONHelper
  def json_response
    JSON.parse(response.body).with_indifferent_access
  end
end

RSpec.configure do |config|
  config.include RespondWithHelper, type: :controller
  config.include JSONHelper, type: :controller
end
