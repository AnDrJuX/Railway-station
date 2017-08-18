class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :sort_stations, -> (route_id) {RailwayStationsRoute.where(route_id: route_id).order(:number_st)}

  def update_position(route, position)
    rst = RailwayStationsRoute.find_by(route: route, railway_station: self)
    rst.number_st = position
    rst.update(position: position) if rst
  end
end

# Добавить возможность указать порядковый номер станции в маршруте (поле для сортировки).
# Учесть, что одна и та же станция может входить в разные маршруты и иметь разный
# порядковый номер в разных маршрутах. Пока установку порядкового номера сделать
# без веб-интерфейса, можно это делать через rails-консоль.
# Выводить список станций в маршруте по порядковому номеру (использовать скоуп для сортировки)