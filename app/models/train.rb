class Train < ApplicationRecord
  has_many :wagons
  belongs_to :route, optional: true
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', optional: true

  validates :name, presence: true

  def wagon_type(type_w)
    self.wagons.where(name: type_w)
    self.wagons.where(name: type_w).count
  end

  def wagon_bottom_seats(type_w, bottom_place)
    self.wagons.where(name: type_w).sum(bottom_place)
  end

  def wagon_top_seats(type_w, top_place)
    self.wagons.where(name: type_w).sum(top_place)
  end
end

# У поезда сделать флаг (поле в таблице типа boolean) - сортировка вагона.
# Значения: с головы/c хвоста поезда. Если выбран вариант “с головы поезда”,
# то вагоны на странице поезда выводятся в прямом порядке, если “с хвоста поезда” - в обратном.

# Используя AR Query Interface, реализовать метод в модели Train,
# который принимает в качестве аргумента тип вагона и тип мест
# (вернхние/нижние/cидячие) и вовзращает их общее кол-во для поезда
# (т.е. считает по всем вагонам указанного типа).
