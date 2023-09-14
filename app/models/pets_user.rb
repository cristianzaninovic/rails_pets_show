class PetsUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :admin]
  has_many :pet_posts, dependent: :destroy
  has_many :pet_comments, dependent: :destroy
  has_many :pet_user_likes, dependent: :destroy
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end                
end
