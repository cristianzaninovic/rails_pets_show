PetUserLike.delete_all
PetComment.delete_all
PetPost.delete_all
PetsUser.delete_all
# Users load
10.times do 
  user = PetsUser.new(
    :email                 => Faker::Internet.email,
    :password              => "123456",
    :password_confirmation => "123456"
  )
  user.save!
end
# admin loadin
user = PetsUser.new(
  :email                 => 'admin@else.cl',
  :password              => "123456",
  :password_confirmation => "123456",
  :role => 'admin'
)
user.save!
# posts
9.times do
  n = PetPost.new
  n.pets_user_id = rand(1..10)
  n.title = Faker::Lorem.sentence  
  n.body = Faker::Lorem.paragraph
  image_name = "cats#{rand(1..9)}.jpg"
  image_file_path = Rails.root.join('app', 'assets', 'images', image_name)
  image_file = File.open(image_file_path)
  n.images.attach(io: image_file, filename: image_name)
  n.save!
end
# comentarios
100.times do
  comment = PetComment.new
  comment.body = Faker::Lorem.paragraph
  comment.pet_post_id = rand(1..9)
  comment.pets_user_id = rand(1..10)
  comment.save!
end
