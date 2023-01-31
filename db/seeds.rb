# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

csv_path = Rails.root.join('db', 'airlines.csv')
copy_clause = "COPY airlines FROM '#{csv_path}' WITH(FORMAT CSV, HEADER)"
ActiveRecord::Base.connection.execute(copy_clause)

csv_path = Rails.root.join('db', 'airports.csv')
copy_clause = "COPY airports FROM '#{csv_path}' WITH(FORMAT CSV, HEADER)"
ActiveRecord::Base.connection.execute(copy_clause)

csv_path = Rails.root.join('db', 'flights.csv')
copy_clause = "COPY flights FROM '#{csv_path}' WITH(FORMAT CSV, HEADER)"
ActiveRecord::Base.connection.execute(copy_clause)