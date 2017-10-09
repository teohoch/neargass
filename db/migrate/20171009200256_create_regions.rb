class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|
      t.integer :code
      t.string :name
      t.point :location

      t.timestamps
    end
  end
end
