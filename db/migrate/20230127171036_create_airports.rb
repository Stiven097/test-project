class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :iata_code
      t.string :airport
      t.string :city
      t.string :state
      t.string :country
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
