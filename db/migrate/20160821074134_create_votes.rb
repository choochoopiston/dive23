class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :answer_id
      t.boolean :is_positive, null: false, default: false
      t.boolean :deleted_flg, null: false, default: false
      t.timestamps null: false
    end
  end
end
