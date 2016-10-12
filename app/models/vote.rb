class Vote < ActiveRecord::Base
  belongs_to :answer
  belongs_to :question
  belongs_to :user

  default_scope -> { where(deleted_flg: false) }
end
