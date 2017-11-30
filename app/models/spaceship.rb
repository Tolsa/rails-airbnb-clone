 class Spaceship < ApplicationRecord
  belongs_to :user

  CATEGORIES_SHIP = ["Espace", "Air", "Aquatique", "Terrestre"]
  validates_inclusion_of :category, in: CATEGORIES_SHIP

  validates :name, uniqueness: true, presence: true
  validates :category, presence: true
  validates :planet, presence: true

  has_many :reservations, :dependent => :destroy

  mount_uploader :photo, PhotoUploader

end
