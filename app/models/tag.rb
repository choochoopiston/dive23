class Tag < ActiveRecord::Base
  has_many   :tag_relations
  has_many   :questions, through: :tag_relations
end
