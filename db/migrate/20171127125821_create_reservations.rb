class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :start_date
      t.string :end_date
      t.references :starship, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
