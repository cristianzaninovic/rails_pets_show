require "application_system_test_case"

class PetPostsTest < ApplicationSystemTestCase
  setup do
    @pet_post = pet_posts(:one)
  end

  test "visiting the index" do
    visit pet_posts_url
    assert_selector "h1", text: "Pet posts"
  end

  test "should create pet post" do
    visit pet_posts_url
    click_on "New pet post"

    fill_in "Body", with: @pet_post.body
    fill_in "Pets user", with: @pet_post.pets_user_id
    fill_in "Title", with: @pet_post.title
    click_on "Create Pet post"

    assert_text "Pet post was successfully created"
    click_on "Back"
  end

  test "should update Pet post" do
    visit pet_post_url(@pet_post)
    click_on "Edit this pet post", match: :first

    fill_in "Body", with: @pet_post.body
    fill_in "Pets user", with: @pet_post.pets_user_id
    fill_in "Title", with: @pet_post.title
    click_on "Update Pet post"

    assert_text "Pet post was successfully updated"
    click_on "Back"
  end

  test "should destroy Pet post" do
    visit pet_post_url(@pet_post)
    click_on "Destroy this pet post", match: :first

    assert_text "Pet post was successfully destroyed"
  end
end
