class CreateCommunes < ActiveRecord::Migration[5.1]
  def change
    create_table :communes do |t|
      t.integer :code
      t.string :name
      t.st_point :location, geographic: true
      t.integer :parent_code
      t.integer :parent_code
      t.references :province, foreign_key: true
      t.string :full_name
      t.timestamps
    end
  end
end
