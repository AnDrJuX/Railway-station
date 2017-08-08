class Wagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.string :number
      t.integer :top_place
      t.integer :bottom_place
      t.integer :side_top_place
      t.integer :side_bottom_place
      t.integer :seat_place
      t.string :type

      t.timestamps
    end
  end
end
