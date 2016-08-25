class CreateAstroturves < ActiveRecord::Migration[5.0]
  def change
    create_table :astroturves do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :info
      t.string :phone
      t.text :map
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.timestamps
    end
  end
end
