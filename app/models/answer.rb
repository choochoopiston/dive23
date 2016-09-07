class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes
  
  default_scope -> { where(deleted_flg: false) }
  
end
