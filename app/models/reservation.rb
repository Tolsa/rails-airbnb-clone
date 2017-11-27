class Reservation < ApplicationRecord
  belongs_to :starship
  belongs_to :user
end
