class CreateAstroturvesServices < ActiveRecord::Migration[5.0]
  def change
    create_table :astroturves_services, :id => false do |t|
      t.integer :astroturf_id
      t.integer :service_id
    end
  end
end
