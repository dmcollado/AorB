require 'test_helper'

class PollItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get poll_items_new_url
    assert_response :success
  end

  test "should get create" do
    get poll_items_create_url
    assert_response :success
  end

  test "should get show" do
    get poll_items_show_url
    assert_response :success
  end

  test "should get destroy" do
    get poll_items_destroy_url
    assert_response :success
  end

end
