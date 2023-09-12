class PetPost < ApplicationRecord
  validates :title, :body, presence: true
  belongs_to :pets_user
end
