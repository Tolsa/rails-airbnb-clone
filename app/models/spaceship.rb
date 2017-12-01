 class Spaceship < ApplicationRecord
  include PgSearch
  belongs_to :user

  # CATEGORY_SHIP = ["Espace", "Air", "Aquatique", "Terrestre"]
  # validates_inclusion_of :category, in: CATEGORY_SHIP

  validates :name, uniqueness: true, presence: true
  validates :category, presence: true
  validates :planet, presence: true

  has_many :reservations, :dependent => :destroy

  mount_uploader :photo, PhotoUploader




  pg_search_scope :search_by_category_and_planet,
  against: [:category, :planet],
  using: {
    tsearch: { prefix: true }
  }

end
