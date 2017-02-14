require 'test_helper'

class TrackedUrlsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get visit" do
    get :visit
    assert_response :success
  end

end
