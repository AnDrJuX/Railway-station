class Train < ApplicationRecord
  has_many :wagons
  belongs_to :route, optional: true
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', optional: true

  validates :number, presence: true

  def seats_amount(type_wagon, type_place)
    self.wagons.where(type: type_wagon).sum(type_place)
  end
end

# У поезда сделать флаг (поле в таблице типа boolean) - сортировка вагона.
# Значения: с головы/c хвоста поезда. Если выбран вариант “с головы поезда”,
# то вагоны на странице поезда выводятся в прямом порядке, если “с хвоста поезда” - в обратном.

# Используя AR Query Interface, реализовать метод в модели Train,
# который принимает в качестве аргумента тип вагона и тип мест
# (вернхние/нижние/cидячие) и вовзращает их общее кол-во для поезда
# (т.е. считает по всем вагонам указанного типа).
