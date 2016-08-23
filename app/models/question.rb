class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :favorites
  has_many   :answers
  has_many   :votes
  
  validates_presence_of :title, :content, :user_id
end
