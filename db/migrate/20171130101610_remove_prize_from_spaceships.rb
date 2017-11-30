class RemovePrizeFromSpaceships < ActiveRecord::Migration[5.1]
  def change
    remove_column :spaceships, :prize, :integer
  end
end
