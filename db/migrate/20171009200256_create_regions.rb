class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|
      t.integer :code
      t.string :name
      t.st_point :location, geographic: true
      t.timestamps
    end
  end
end
