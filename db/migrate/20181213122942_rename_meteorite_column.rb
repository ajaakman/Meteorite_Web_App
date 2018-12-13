class RenameMeteoriteColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :meteorites, :class, :meteorite_class
  end
end
