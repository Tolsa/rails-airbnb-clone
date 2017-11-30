class AddAvailableToSpaceships < ActiveRecord::Migration[5.1]
  def change
    add_column :spaceships, :available, :string, default: "available", nill: false
  end
end
