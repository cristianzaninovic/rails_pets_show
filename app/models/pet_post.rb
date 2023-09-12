class PetPost < ApplicationRecord
  validates :title, :body, presence: true
  belongs_to :pets_user
  has_many_attached :images, dependent: :destroy
end
