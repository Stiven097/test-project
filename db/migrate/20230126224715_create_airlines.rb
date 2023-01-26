class CreateAirlines < ActiveRecord::Migration[7.0]
  def change
    create_table :airlines do |t|
      t.string :iata_code
      t.string :airline

      t.timestamps
    end
  end
end
