class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :favorite]
  before_action :set_user, only: [:show, :favorite]

  def index
    @users = User.all.order(score: :desc, created_at: :asc)
  end
  
  def show
    case params[:tab]
    when "answer"
      case params[:order]
      when "vote"
        @answers = @user.answers.order("posi_counts-nega_counts DESC")
      else
        @answers = @user.answers.order("created_at DESC")
      end
    else
      case params[:order]
      when "vote"
        @questions = @user.questions.order("posi_counts-nega_counts DESC")
      else
        @questions = @user.questions.order("created_at DESC")
      end
    end
  end
  
  def favorite
    @favorites = @user.favorites.order("created_at DESC")
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end
    
end
