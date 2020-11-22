require 'test_helper'

class FoodRegistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get food_regists_new_url
    assert_response :success
  end

  test "should get show" do
    get food_regists_show_url
    assert_response :success
  end

  test "should get create" do
    get food_regists_create_url
    assert_response :success
  end

  test "should get edit" do
    get food_regists_edit_url
    assert_response :success
  end

  test "should get update" do
    get food_regists_update_url
    assert_response :success
  end
end
