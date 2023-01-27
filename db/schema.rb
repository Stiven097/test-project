# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_27_204430) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string "iata_code"
    t.string "airline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string "iata_code"
    t.string "airport"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.integer "flight_number"
    t.integer "year"
    t.string "month"
    t.string "day"
    t.string "day_of_week"
    t.bigint "airline_id"
    t.string "tail_number"
    t.bigint "origin_airport_id"
    t.bigint "destination_airport_id"
    t.integer "scheduled_departure"
    t.integer "departure_time"
    t.integer "departure_delay"
    t.integer "taxi_out"
    t.integer "wheels_off"
    t.integer "scheduled_time"
    t.integer "elapsed_time"
    t.integer "air_time"
    t.integer "distance"
    t.integer "wheels_on"
    t.integer "taxi_in"
    t.integer "scheduled_arrival"
    t.integer "arrival_time"
    t.integer "arrival_delay"
    t.integer "diverted"
    t.integer "cancelled"
    t.text "cancellation_reason"
    t.integer "air_system_delay", default: 0
    t.integer "security_delay", default: 0
    t.integer "airline_delay", default: 0
    t.integer "late_aircraft_delay", default: 0
    t.integer "weather_delay", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airline_id"], name: "index_flights_on_airline_id"
    t.index ["destination_airport_id"], name: "index_flights_on_destination_airport_id"
    t.index ["origin_airport_id"], name: "index_flights_on_origin_airport_id"
  end

  add_foreign_key "flights", "airlines"
  add_foreign_key "flights", "airports", column: "destination_airport_id"
  add_foreign_key "flights", "airports", column: "origin_airport_id"
end
