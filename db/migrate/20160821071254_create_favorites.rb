class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :question_id
      t.boolean :deleted_flg, null: false, default: false
      t.timestamps null: false
    end
  end
end
