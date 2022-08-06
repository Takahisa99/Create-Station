require "test_helper"

class CreatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get creates_index_url
    assert_response :success
  end

  test "should get show" do
    get creates_show_url
    assert_response :success
  end

  test "should get create" do
    get creates_create_url
    assert_response :success
  end

  test "should get edit" do
    get creates_edit_url
    assert_response :success
  end
end
