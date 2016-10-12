class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :check_mine, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :tagged]

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

  def tagged
    @questions = Question.tagged_with(params[:tag_id])
    @tag = Tag.find(params[:tag_id])
    if @questions.blank?
      # nilの場合は画面表示用に０件の配列に変換する
      @questions = Array.new
      flash.now[:notice] = "現在、そのタグに関連する質問はありません。"
    elsif params[:tab] == "votes" 
      @questions = @questions.sort_by{|question| question.posi_counts - question.nega_counts}.reverse
    else
      @questions = @questions.sort_by{|question| question.created_at}.reverse
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
    respond_to do |format|
      begin
        ActiveRecord::Base.transaction do
          # question.tag_list=(tags)が呼ばれtagsにparam[:quesetion][:tag_list]が登録される
          @question = current_user.questions.build(question_params)
          # questionsとtag_relationsにデータが登録される
          @question.save!
        end
        format.html { redirect_to @question, notice: '質問を投稿しました。' }
      rescue => e
        format.html { redirect_to new_question_path, notice: '質問を投稿出来ませんでした。' }
        Rails.logger.error e.message
        Rails.logger.error e.backtrace.join("\n")
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
    begin
      ActiveRecord::Base.transaction do
        @question.favorites.each do |f|
          @question.decrement(:favorite_counts, 1).save!
          f.deleted_flg = true
          f.save!
        end
        @question.tag_relations.each do |t|
          t.deleted_flg = true
          t.save!
        end
        @question.votes.each do |v|
          if v.answer_id.blank?
            if v.is_positive == true
              @question.decrement(:posi_counts, 1).save!
            else
              @question.decrement(:nega_counts, 1).save!
            end
          else
            if v.is_positive == true
              v.answer.decrement(:posi_counts, 1).save!
            else
              v.answer.decrement(:nega_counts, 1).save!
            end
          end
            v.deleted_flg = true
            v.save!
        end
        @question.answers.each do |a|
          a.deleted_flg = true
          a.save!
        end
        @question.deleted_flg = true
        @question.save!
        respond_to do |format|
          format.html { redirect_to questions_url, notice: '質問を削除しました。' }
        end
      end
    rescue => e
      respond_to do |format|
        format.html { redirect_to :back, notice: '質問を削除出来ませんでした。' }
      end
      Rails.logger.error e.message
      Rails.logger.error e.backtrace.join("\n")
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
        redirect_to :questions, notice: '編集権限がありません'
      end
    end
end
