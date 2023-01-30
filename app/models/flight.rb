class Flight < ApplicationRecord
  has_many :airlines
  has_many :airports
end
