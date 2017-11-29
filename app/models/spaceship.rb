class Spaceship < ApplicationRecord
  belongs_to :user

  CATEGORIES_SHIP = ["Espace", "Air", "Aquatique", "Terrestre"]
  validates_inclusion_of :category, in: CATEGORIES_SHIP

  validates :name, uniqueness: true, presence: true
  validates :category, presence: true
  validates :planet, presence: true
  validates :prize, presence: true

  has_many :reservations

  mount_uploader :photo, PhotoUploader

end
