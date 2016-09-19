class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :check_mine, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    case params[:tab] 
    when "active"
      @questions = Question.all.order(updated_at: :desc) #TODO n.uchiyama 紐づくanswersの更新日時とソート順を考慮する必要あり
    when "favorite"
      @questions = Question.all.order(favorite_counts: :desc, updated_at: :desc) #TODO n.uchiyama 紐づくanswersの更新日時とソート順を考慮する必要あり
    else
      @questions = Question.all.order(updated_at: :desc)
    end
  end

  def show
    @contribution_counts = @question.posi_counts - @question.nega_counts
    @answer = @question.answers.build
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = current_user.questions.build(question_params)
    @question.tag_list = params[:question][:tag_list]
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: '質問を投稿しました。' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: '質問を更新しました。' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @question.deleted_flg = true
    @question.save
    respond_to do |format|
      format.html { redirect_to questions_url, notice: '質問を削除しました。' }
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:user_id, :title, :content, :photo, :favorite_counts, :posi_counts, :nega_counts, :deleted_flg, :tag_list)
    end

    def check_mine
      unless @question.user.id == current_user.id
        redirect_to :questions, notice: '編集権限がありません' #TODO m.kitamura メッセージ定義
      end
    end
end
