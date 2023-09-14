class CreatePetUserLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :pet_user_likes do |t|
      t.references :pet_post, null: false, foreign_key: true
      t.references :pets_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
