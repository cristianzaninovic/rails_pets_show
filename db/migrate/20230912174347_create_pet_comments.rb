class CreatePetComments < ActiveRecord::Migration[7.0]
  def change
    create_table :pet_comments do |t|
      t.text :body
      t.belongs_to :pets_user, null: false, foreign_key: true
      t.belongs_to :pet_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
