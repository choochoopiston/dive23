class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :answers
  has_many :questions
  has_many :favorites
  has_many :votes

  validates_presence_of :name

  scope :active, -> { where(deleted_flg: false) }

  def favorite?(question)
    favorites.find_by(question_id: question.id)
  end

  def vote_plus?(question)
    votes.where(is_positive: true).find_by(question_id: question.id)
  end

  def vote_plus_answer?(answer)
    votes.where(is_positive: true).find_by(answer_id: answer.id)
  end

  def vote_minus?(question)
    votes.where(is_positive: false).find_by(question_id: question.id)
  end

  def vote_minus_answer?(answer)
    votes.where(is_positive: false).find_by(answer_id: answer.id)
  end

  # prohibit deleted_user to sign in
  def self.find_for_authentication(conditions)
    super(conditions.merge(:deleted_flg => "false"))
  end

end
