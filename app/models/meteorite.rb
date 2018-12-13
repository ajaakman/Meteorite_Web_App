class Meteorite < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :meteorite_class, presence: true
  validates :mass, presence: true
  validates :year, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
