class AnswersController < ApplicationController
  before_action :check_mine, only: [:destroy]
  
  def create
    @answer = current_user.answers.build(answer_params)
    @answer.question_id = params[:question_id]
    @question = @answer.question

    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@question), notice: '回答が投稿されました。' }
      else
        format.html { redirect_to question_path(@question), notice: '回答の投稿に失敗しました。' }
      end
    end
  end
  
  def destroy
    begin
      ActiveRecord::Base.transaction do
        @question = @answer.question
        @answer.votes.each do |v|
          unless v.answer_id.blank?
            if v.is_positive == true
              v.answer.decrement(:posi_counts, 1).save!
            else
              v.answer.decrement(:nega_counts, 1).save!
            end
          end
          v.deleted_flg = true
          v.save!
        end
        @answer.deleted_flg = true
        @answer.save!
        respond_to do |format|
          format.html { redirect_to question_path(@question), notice: '回答が削除されました。' }
        end
      end
    rescue => e
      respond_to do |format|
        format.html { redirect_to :back, notice: '回答を削除出来ませんでした。' }
      end
      Rails.logger.error e.message
      Rails.logger.error e.backtrace.join("\n")
    end
  end
  
  private
    def answer_params
      params.require(:answer).permit(:question_id, :user_id, :content, :photo, :posi_counts, :nega_counts, :deleted_flg)
    end

    def check_mine
      @answer = Answer.find(params[:id])
      unless @answer.user.id == current_user.id
        #TODO m.kitamura View実装が済み次第、遷移先変更
        redirect_to :questions, notice: '編集権限がありません'
      end
    end
end
