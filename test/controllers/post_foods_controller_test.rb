require 'test_helper'

class PostFoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_foods_index_url
    assert_response :success
  end

  test "should get show" do
    get post_foods_show_url
    assert_response :success
  end

  test "should get new" do
    get post_foods_new_url
    assert_response :success
  end

  test "should get create" do
    get post_foods_create_url
    assert_response :success
  end

  test "should get edit" do
    get post_foods_edit_url
    assert_response :success
  end

  test "should get update" do
    get post_foods_update_url
    assert_response :success
  end

  test "should get destroy" do
    get post_foods_destroy_url
    assert_response :success
  end
end
