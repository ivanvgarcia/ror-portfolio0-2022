require "test_helper"

class Blog::CommentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_comment_index_url
    assert_response :success
  end

  test "should get show" do
    get blog_comment_show_url
    assert_response :success
  end

  test "should get destroy" do
    get blog_comment_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get blog_comment_edit_url
    assert_response :success
  end
end
