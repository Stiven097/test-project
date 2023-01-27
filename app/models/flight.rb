class Flight < ApplicationRecord
  has_and_belongs_to_many :airlines
  has_and_belongs_to_many :airports
end
