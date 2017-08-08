class SeatWagon < Wagon
  validates :seat_place, presence: true
end