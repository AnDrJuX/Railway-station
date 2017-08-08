class EconomyWagon < Wagon
  validates :side_top_place, :side_bottom_place, :top_place, :bottom_place, presence: true
end