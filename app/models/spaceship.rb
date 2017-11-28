class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :reservations
  mount_uploader :photo, PhotoUploader
  
  def index
  end

  def show
  end

end
