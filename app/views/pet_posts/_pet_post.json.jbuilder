json.extract! pet_post, :id, :title, :body, :pets_user_id, :created_at, :updated_at
json.url pet_post_url(pet_post, format: :json)
