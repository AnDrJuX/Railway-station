class Wagon < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.string :name
      t.string :top_place
      t.string :bottom_place

      t.timestamps
    end
  end
end
