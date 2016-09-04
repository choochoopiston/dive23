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
    @question = @answer.question
    @answer.deleted_flg = true
    @answer.save
    
    respond_to do |format|
      format.html { redirect_to question_path(@question), notice: '回答が削除されました。' }
    end
  end
  
  private
    def answer_params
      params.require(:answer).permit(:question_id, :user_id, :content, :photo, :posi_counts, :nega_counts, :deleted_flg)
    end

    def check_mine
      @answer = Answer.find(params[:id])
      unless @answer.user.id == current_user.id
        #TODO m.kitamura メッセージ定義
        #TODO m.kitamura View実装が済み次第、遷移先変更
        redirect_to :questions, notice: '編集権限がありません'
      end
    end
end
