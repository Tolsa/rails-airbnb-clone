class AddPlanetToSpaceships < ActiveRecord::Migration[5.1]
  def change
    add_column :spaceships, :planet, :string
    remove_column :spaceships, :size
  end
end
