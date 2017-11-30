class AddPriceToSpaceships < ActiveRecord::Migration[5.1]
  def change
    add_column :spaceships, :price, :integer
  end
end
