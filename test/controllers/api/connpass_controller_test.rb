require 'test_helper'

class Api::ConnpassControllerTest < ActionDispatch::IntegrationTest
  test "should get event" do
    get api_connpass_event_url
    assert_response :success
  end

end
