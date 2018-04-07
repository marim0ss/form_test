require 'test_helper'

class Test2ControllerTest < ActionController::TestCase
  test "should get postform" do
    get :postform
    assert_response :success
  end

end
