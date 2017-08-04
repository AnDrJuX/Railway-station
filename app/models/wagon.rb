class Wagon < ApplicationRecord
  belongs_to :train

  validates :name, presence: true
end