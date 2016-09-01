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
  
end
