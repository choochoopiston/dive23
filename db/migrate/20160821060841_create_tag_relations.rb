class CreateTagRelations < ActiveRecord::Migration
  def change
    create_table :tag_relations do |t|
      t.integer :question_id
      t.integer :tag_id
      t.boolean :deleted_flg, null: false, default: false
      t.timestamps null: false
    end
  end
end
