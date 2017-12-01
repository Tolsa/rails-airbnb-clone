class Review < ApplicationRecord
  belongs_to :spaceship
  validates :content, length: { minimum: 20 }
end
