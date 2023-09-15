class AllowAnonPetUserComments < ActiveRecord::Migration[7.0]
  def change
    change_column_null :pet_comments, :pets_user_id, true
  end
end
