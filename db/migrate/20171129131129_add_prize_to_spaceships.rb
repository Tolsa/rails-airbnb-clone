class AddPrizeToSpaceships < ActiveRecord::Migration[5.1]
  def change
    add_column :spaceships, :prize, :integer
  end
end
