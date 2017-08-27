class RemoveAddColumnToRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    remove_column :railway_stations_routes, :number_st, :integer
    add_column :railway_stations_routes, :position, :integer
  end
end
