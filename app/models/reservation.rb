class Reservation < ApplicationRecord
  belongs_to :spaceship
  belongs_to :user

  def total_price
    zoub = spaceship.price * (Date.parse(end_date) - Date.parse(start_date)).to_i
    zoub.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1 ")
  end

end



