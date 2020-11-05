require 'test_helper'

class FoodRegistCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get food_regist_carts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get food_regist_carts_destroy_url
    assert_response :success
  end

end
