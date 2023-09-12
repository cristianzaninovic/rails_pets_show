class CreatePetPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :pet_posts do |t|
      t.string :title
      t.text :body
      t.belongs_to :pets_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
