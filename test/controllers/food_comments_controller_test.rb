require 'test_helper'

class FoodCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get food_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get food_comments_destroy_url
    assert_response :success
  end
end
