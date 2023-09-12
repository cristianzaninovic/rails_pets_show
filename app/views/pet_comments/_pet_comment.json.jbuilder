json.extract! pet_comment, :id, :body, :pets_user_id, :pet_post_id, :created_at, :updated_at
json.url pet_comment_url(pet_comment, format: :json)
