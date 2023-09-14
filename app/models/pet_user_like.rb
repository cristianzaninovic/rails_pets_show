class PetUserLike < ApplicationRecord
  belongs_to :pet_post
  belongs_to :pets_user
end
