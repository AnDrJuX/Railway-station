class Ticket < ApplicationRecord
  validates :name, :surname, :patronymic, :passport_serial, :passport_number, presence: true

  belongs_to :user
  belongs_to :train
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

  after_create :send_notification
  after_destroy :send_notification_delete

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_notification_delete
    TicketsMailer.delete_ticket(self.user, self).deliver_now
  end

  def route_name
    "#{first_station.title} - #{last_station.title}"
  end
end