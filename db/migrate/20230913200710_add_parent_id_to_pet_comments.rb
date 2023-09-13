class AddParentIdToPetComments < ActiveRecord::Migration[7.0]
  def change
    add_column :pet_comments, :parent_id, :integer
  end
end
