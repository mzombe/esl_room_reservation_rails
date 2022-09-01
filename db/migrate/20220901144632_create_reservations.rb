class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.text :description
      t.integer :hour
      t.integer :day
      t.integer :week
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end
