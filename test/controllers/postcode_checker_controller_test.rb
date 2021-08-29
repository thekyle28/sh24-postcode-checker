require 'test_helper'

class PostcodeCheckerControllerTest < ActionDispatch::IntegrationTest  
  test 'should get index' do
    get postcode_checker_path
    assert_response :success
  end

  test 'all posts should re-render the page' do
    TEST_POSTCODES.each do |test_postcode|
      post postcode_checker_path, params: { postcode: test_postcode }
      assert_template :index
    end
  end
end
