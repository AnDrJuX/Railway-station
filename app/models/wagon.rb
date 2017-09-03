class Wagon < ApplicationRecord

  TYPES = { SeatWagon: 'Сидячий', EconomyWagon: 'Плацкарт', CoupeWagon: 'Купе', PremiumWagon: 'СВ' }.freeze

  belongs_to :train

  validates :number, presence: true, uniqueness: {scope: :train_id}
  before_validation :set_number

  scope :head, -> {order(:number)}
  scope :tail, -> {order(:number).reverse_order}

  def set_number
    self.number ||= train.wagons.maximum(:number).to_i + 1
  end

  def get_types
    TYPES[self.type]
  end
end