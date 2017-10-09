class CreateCommunes < ActiveRecord::Migration[5.1]
  def change
    create_table :communes do |t|
      t.integer :code
      t.string :name
      t.point :location
      t.integer :parent_code
      t.integer :parent_code
      t.references :province, foreign_key: true

      t.timestamps
    end
  end
end
