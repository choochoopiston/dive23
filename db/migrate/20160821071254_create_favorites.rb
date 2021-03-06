class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.boolean :deleted_flg, null: false, default: false
      t.timestamps null: false
    end
  end
end
