class AddColumnToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :surname, :string
    add_column :tickets, :patronymic, :string
    add_column :tickets, :passport_serial, :integer
    add_column :tickets, :passport_number, :integer
    add_column :tickets, :first_station_id, :integer
    add_column :tickets, :last_station_id, :integer
  end
end
