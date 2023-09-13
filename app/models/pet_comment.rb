class PetComment < ApplicationRecord
  belongs_to :pets_user, optional: true
  belongs_to :pet_post
  validates :body, presence: true
  belongs_to :parent, class_name: 'PetComment', optional: true
  has_many :replies, class_name: 'PetComment', foreign_key: :parent_id, dependent: :destroy
 

end
