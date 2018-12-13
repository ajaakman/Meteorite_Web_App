class CreateMeteorites < ActiveRecord::Migration[5.1]
  def change
    create_table :meteorites do |t|
      t.string :name
      t.string :meteorite_class
      t.float :mass
      t.integer :year
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    add_index :meteorites, :name, unique: true
  end
end
