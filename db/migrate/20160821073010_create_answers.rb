class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true, foreign_key: true
      t.integer :user_id
      t.text :content, null: false
      t.string :photo
      t.integer :posi_counts, default: 0
      t.integer :nega_counts, default: 0
      t.boolean :deleted_flg, null: false, default: false
      t.timestamps null: false
    end
  end
end
