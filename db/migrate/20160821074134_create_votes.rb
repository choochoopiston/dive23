class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.references :question, index: true, foreign_key: true
      t.integer :answer_id
      t.boolean :is_positive, null: false, default: false
      t.boolean :deleted_flg, null: false, default: false
      t.timestamps null: false
    end
  end
end
