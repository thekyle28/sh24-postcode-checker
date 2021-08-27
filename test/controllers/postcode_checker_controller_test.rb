require "test_helper"

class PostcodeCheckerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postcode_checker_index_url
    assert_response :success
  end
end
