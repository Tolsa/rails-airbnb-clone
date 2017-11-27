class CreateSpaceships < ActiveRecord::Migration[5.1]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.string :category
      t.string :power
      t.integer :seats
      t.string :constructor
      t.string :weapons
      t.string :maxspeed
      t.string :size
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
