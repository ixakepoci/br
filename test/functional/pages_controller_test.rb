require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
  end

  test "should get giverreg" do
    get :giverreg
    assert_response :success
  end

  test "should get getterreg" do
    get :getterreg
    assert_response :success
  end

end
