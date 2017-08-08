class CoupeWagon < Wagon
  validates :top_place, :bottom_place, presence: true
end