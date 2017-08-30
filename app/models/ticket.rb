class Ticket < ApplicationRecord
  validates :name, :surname, :patronymic, :passport_serial, :passport_number, presence: true

  belongs_to :user
  belongs_to :train
  belongs_to :first_station_id, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id
end