class Spaceship < ApplicationRecord
  belongs_to :user

  # CATEGORY_SHIP = ["Espace", "Air", "Aquatique", "Terrestre"]
  # validates_inclusion_of :category, in: CATEGORY_SHIP

  validates :name, uniqueness: true, presence: true
  validates :category, presence: true
  validates :planet, presence: true

  has_many :reservations

  mount_uploader :photo, PhotoUploader


  include PgSearch

  pg_search_scope :search_by_category_and_planet,
  against: [ :category, :planet ],
  using: {
    tsearch: { prefix: true }
  }

end
