class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :answer, index: true, foreign_key: true
      t.boolean :is_positive, null: false, default: false
      t.boolean :deleted_flg, null: false, default: false
      t.timestamps null: false
    end
  end
end
