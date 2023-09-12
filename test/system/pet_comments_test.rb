require "application_system_test_case"

class PetCommentsTest < ApplicationSystemTestCase
  setup do
    @pet_comment = pet_comments(:one)
  end

  test "visiting the index" do
    visit pet_comments_url
    assert_selector "h1", text: "Pet comments"
  end

  test "should create pet comment" do
    visit pet_comments_url
    click_on "New pet comment"

    fill_in "Body", with: @pet_comment.body
    fill_in "Pet post", with: @pet_comment.pet_post_id
    fill_in "Pets user", with: @pet_comment.pets_user_id
    click_on "Create Pet comment"

    assert_text "Pet comment was successfully created"
    click_on "Back"
  end

  test "should update Pet comment" do
    visit pet_comment_url(@pet_comment)
    click_on "Edit this pet comment", match: :first

    fill_in "Body", with: @pet_comment.body
    fill_in "Pet post", with: @pet_comment.pet_post_id
    fill_in "Pets user", with: @pet_comment.pets_user_id
    click_on "Update Pet comment"

    assert_text "Pet comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Pet comment" do
    visit pet_comment_url(@pet_comment)
    click_on "Destroy this pet comment", match: :first

    assert_text "Pet comment was successfully destroyed"
  end
end
