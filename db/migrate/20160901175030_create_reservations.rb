class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :astroturf, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
