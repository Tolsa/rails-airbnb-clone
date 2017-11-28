class Spaceship < ApplicationRecord
  belongs_to :user
  CATEGORIES_SHIP = ["Space", "Air", "Sea", "Earth"]
  validates_inclusion_of :category, in: CATEGORIES_SHIP

  mount_uploader :photo, PhotoUploader

  def index
  end

  def show
  end

end
