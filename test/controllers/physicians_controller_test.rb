require 'test_helper'

class PhysiciansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get physicians_index_url
    assert_response :success
  end

  test "should get show" do
    get physicians_show_url
    assert_response :success
  end

  test "should get new" do
    get physicians_new_url
    assert_response :success
  end

end
