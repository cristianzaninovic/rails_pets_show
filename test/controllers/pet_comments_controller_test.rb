require "test_helper"

class PetCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet_comment = pet_comments(:one)
  end

  test "should get index" do
    get pet_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_pet_comment_url
    assert_response :success
  end

  test "should create pet_comment" do
    assert_difference("PetComment.count") do
      post pet_comments_url, params: { pet_comment: { body: @pet_comment.body, pet_post_id: @pet_comment.pet_post_id, pets_user_id: @pet_comment.pets_user_id } }
    end

    assert_redirected_to pet_comment_url(PetComment.last)
  end

  test "should show pet_comment" do
    get pet_comment_url(@pet_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_comment_url(@pet_comment)
    assert_response :success
  end

  test "should update pet_comment" do
    patch pet_comment_url(@pet_comment), params: { pet_comment: { body: @pet_comment.body, pet_post_id: @pet_comment.pet_post_id, pets_user_id: @pet_comment.pets_user_id } }
    assert_redirected_to pet_comment_url(@pet_comment)
  end

  test "should destroy pet_comment" do
    assert_difference("PetComment.count", -1) do
      delete pet_comment_url(@pet_comment)
    end

    assert_redirected_to pet_comments_url
  end
end
