class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :reservations
  def index
  end

  def show
  end
end
