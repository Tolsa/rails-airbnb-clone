class RemovePowerFromSpaceships < ActiveRecord::Migration[5.1]
  def change
    remove_column :spaceships, :power, :string
  end
end
