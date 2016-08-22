class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :favorites
  
  validates_presence_of :title, :content, :user_id
end
