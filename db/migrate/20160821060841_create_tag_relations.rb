class CreateTagRelations < ActiveRecord::Migration
  def change
    create_table :tag_relations do |t|
      t.references :question, index: true, foreign_key: true
      t.integer :tag_id
      t.boolean :deleted_flg, null: false, default: false
      t.timestamps null: false
    end
  end
end
