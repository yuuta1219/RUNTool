require "test_helper"

class TopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @top = tops(:one)
  end

  test "should get index" do
    get tops_url
    assert_response :success
  end

  test "should get new" do
    get new_top_url
    assert_response :success
  end

  test "should create top" do
    assert_difference("Top.count") do
      post tops_url, params: { top: {  } }
    end

    assert_redirected_to top_url(Top.last)
  end

  test "should show top" do
    get top_url(@top)
    assert_response :success
  end

  test "should get edit" do
    get edit_top_url(@top)
    assert_response :success
  end

  test "should update top" do
    patch top_url(@top), params: { top: {  } }
    assert_redirected_to top_url(@top)
  end

  test "should destroy top" do
    assert_difference("Top.count", -1) do
      delete top_url(@top)
    end

    assert_redirected_to tops_url
  end
end
