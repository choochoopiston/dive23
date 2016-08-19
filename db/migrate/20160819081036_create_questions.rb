class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title, null: false
      t.text :content, null: false
      t.string :photo
      t.integer :favorite_counts, default: 0
      t.integer :posi_counts, default: 0
      t.integer :nega_counts, default: 0

      t.timestamps null: false
    end
    add_index :questions, :favorite_counts
  end
end
