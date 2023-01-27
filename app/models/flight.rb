class Flight < ApplicationRecord
  belongs_to :airline
  belongs_to :airport
end
