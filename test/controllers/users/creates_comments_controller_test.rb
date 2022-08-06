require "test_helper"

class Users::CreatesCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_creates_comments_index_url
    assert_response :success
  end

  test "should get show" do
    get users_creates_comments_show_url
    assert_response :success
  end

  test "should get create" do
    get users_creates_comments_create_url
    assert_response :success
  end
end
