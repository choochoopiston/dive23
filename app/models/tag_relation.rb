class TagRelation < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag

  default_scope -> { where(deleted_flg: false) }
end
