class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :astroturf, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
