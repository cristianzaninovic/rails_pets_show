class PetPost < ApplicationRecord
  validates :title, :body, presence: true
  belongs_to :pets_user, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  has_many :pet_comments
end
