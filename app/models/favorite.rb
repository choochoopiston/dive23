class Favorite < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  default_scope -> { where(deleted_flg: false) }
end
