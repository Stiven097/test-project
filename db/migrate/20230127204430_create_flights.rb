class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :flight_number
      t.integer :year
      t.string :month
      t.string :day
      t.string :day_of_week
      t.references :airline, foreign_key: true
      t.string :tail_number
      t.references :origin_airport, foreign_key: { to_table: :airports }
      t.references :destination_airport, foreign_key: { to_table: :airports }
      t.integer :scheduled_departure
      t.integer :departure_time
      t.integer :departure_delay
      t.integer :taxi_out
      t.integer :wheels_off
      t.integer :scheduled_time
      t.integer :elapsed_time
      t.integer :air_time
      t.integer :distance
      t.integer :wheels_on
      t.integer :taxi_in
      t.integer :scheduled_arrival
      t.integer :arrival_time
      t.integer :arrival_delay
      t.integer :diverted
      t.integer :cancelled
      t.text :cancellation_reason, null: true
      t.integer :air_system_delay, null: true, default: 0
      t.integer :security_delay, null: true, default: 0
      t.integer :airline_delay, null: true, default: 0
      t.integer :late_aircraft_delay, null: true, default: 0
      t.integer :weather_delay, null: true, default: 0

      t.timestamps
    end
  end
end
