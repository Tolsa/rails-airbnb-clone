class Spaceship < ApplicationRecord
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  def index
  end

  def show
  end

end
