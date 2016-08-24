class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :favorites
  has_many   :answers
  has_many   :votes
  has_many   :tag_relations
  
  validates_presence_of :title, :content, :user_id
  
  default_scope -> { where(deleted_flg: false) }
end
