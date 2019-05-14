require 'test_helper'

class ConnpassControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get connpass_index_url
    assert_response :success
  end

end
