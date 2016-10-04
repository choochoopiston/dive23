class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :favorites
  has_many   :answers
  has_many   :votes
  has_many   :tag_relations
  has_many   :tags, through: :tag_relations
  accepts_nested_attributes_for :user
  validates_presence_of :title, :content, :user_id
  
  default_scope -> { where(deleted_flg: false) }

  # 指定したタグが付いたquestionsを検索
  def self.tagged_with(tag)
    Tag.find_by!(name: tag).questions
  end

  # questionに紐づくtagsを返す
  def tag_list
    tags.map(&:name).join(",")
  end
  
  # 入力されたタグがDBに無ければ登録。
  def tag_list=(tags)
    self.tags = tags.split(",").map do |t|
      Tag.find_or_create_by!(name: t.strip)
    end
  end
  
  # 任意の質問において、特定のユーザーがしているお気に入りだけを返す
  def my_favorite(user)
    favorites.find_by(user_id: user.id)
  end
  
end
