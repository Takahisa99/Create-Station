require "test_helper"

class Users::CreatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_creates_index_url
    assert_response :success
  end

  test "should get show" do
    get users_creates_show_url
    assert_response :success
  end

  test "should get create" do
    get users_creates_create_url
    assert_response :success
  end

  test "should get edit" do
    get users_creates_edit_url
    assert_response :success
  end
end
