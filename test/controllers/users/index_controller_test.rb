require "test_helper"

class Users::IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get users_index_edit_url
    assert_response :success
  end

  test "should get show" do
    get users_index_show_url
    assert_response :success
  end
end
