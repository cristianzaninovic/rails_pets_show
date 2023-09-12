require "test_helper"

class PetPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet_post = pet_posts(:one)
  end

  test "should get index" do
    get pet_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_pet_post_url
    assert_response :success
  end

  test "should create pet_post" do
    assert_difference("PetPost.count") do
      post pet_posts_url, params: { pet_post: { body: @pet_post.body, pets_user_id: @pet_post.pets_user_id, title: @pet_post.title } }
    end

    assert_redirected_to pet_post_url(PetPost.last)
  end

  test "should show pet_post" do
    get pet_post_url(@pet_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_post_url(@pet_post)
    assert_response :success
  end

  test "should update pet_post" do
    patch pet_post_url(@pet_post), params: { pet_post: { body: @pet_post.body, pets_user_id: @pet_post.pets_user_id, title: @pet_post.title } }
    assert_redirected_to pet_post_url(@pet_post)
  end

  test "should destroy pet_post" do
    assert_difference("PetPost.count", -1) do
      delete pet_post_url(@pet_post)
    end

    assert_redirected_to pet_posts_url
  end
end
