class RemoveAddColumnToTickets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :start_station_id, :integer
    remove_column :tickets, :end_station_id, :integer
    add_column :tickets, :first_station_id, :integer
    add_column :tickets, :last_station_id, :integer
  end
end
