require 'test_helper'

class PollControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get poll_new_url
    assert_response :success
  end

  test "should get destroy" do
    get poll_destroy_url
    assert_response :success
  end

  test "should get index" do
    get poll_index_url
    assert_response :success
  end

end
