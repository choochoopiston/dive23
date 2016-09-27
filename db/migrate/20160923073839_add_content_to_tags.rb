class AddContentToTags < ActiveRecord::Migration
  def change
    add_column :tags, :content, :text, null: false, default: ""
  end
end
