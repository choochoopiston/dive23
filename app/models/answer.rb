class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes
  
  validates_presence_of :content, :user_id, :question_id
  
  default_scope -> { where(deleted_flg: false) }
  
end
