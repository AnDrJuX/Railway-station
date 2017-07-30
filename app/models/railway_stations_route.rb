class RailwayStationsRoute < ApplicationRecord
  #has_many :trains
  belongs_to :railway_station
  belongs_to :route

end