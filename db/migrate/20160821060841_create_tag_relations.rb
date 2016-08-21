class CreateTagRelations < ActiveRecord::Migration
  def change
    create_table :tag_relations do |t|
      t.integer :question_id, default: 0
      t.integer :tag_id, default: 0
      t.boolean :deleted_flg, null: false, default: false
      t.timestamps null: false
    end
  end
end
