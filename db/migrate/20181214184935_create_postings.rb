class CreatePostings < ActiveRecord::Migration[5.1]
  def change
    create_table :postings do |t|
      t.references :user, foreign_key: true
      t.references :meteorite, foreign_key: true
      t.float :weight
      t.integer :cost

      t.timestamps
    end
  end
end
