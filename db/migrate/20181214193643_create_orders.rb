class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :posting, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
