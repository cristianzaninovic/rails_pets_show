class PetPost < ApplicationRecord
  validates :title, :body, presence: true
  belongs_to :pets_user
  has_many_attached :images, dependent: :destroy
  has_many :pet_comments, dependent: :destroy
  has_many :pet_user_likes, dependent: :destroy
end
