class Wagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.string :name
      t.integer :top_place
      t.integer :bottom_place

      t.timestamps
    end
  end
end
