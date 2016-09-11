class VotesController < ApplicationController
  
  def create
    @vote = current_user.votes.build
    
    unless params[:answer_id].present?
      @vote.question_id = params[:question_id]
      @question = @vote.question
      
      if params[:vote] == "posi"
        @vote.is_positive = true 
        respond_to do |format|
          if @vote.save
            format.html { redirect_to question_path(@question), notice: '質問にグッド!をしました。' }
          else
            format.html { redirect_to question_path(@question), notice: '質問にグッド!できませんでした。' }
          end
        end
      else
        respond_to do |format|
          if @vote.save
            format.html { redirect_to question_path(@question), notice: '質問にノットグッド!をしました。' }
          else
            format.html { redirect_to question_path(@question), notice: '質問にノットグッド!できませんでした。' }
          end
        end
      end
      
    else
      @vote.answer_id = params[:answer_id]
      @answer = @vote.answer
      @question = @answer.question
      
      if params[:vote] == "posi"
        @vote.is_positive = true 
        respond_to do |format|
          if @vote.save
            format.html { redirect_to question_path(@question), notice: '回答にグッド!をしました。' }
          else
            format.html { redirect_to question_path(@question), notice: '回答にグッド!できませんでした。' }
          end
        end
      else
        respond_to do |format|
          if @vote.save
            format.html { redirect_to question_path(@question), notice: '回答にノットグッド!をしました。' }
          else
            format.html { redirect_to question_path(@question), notice: '回答にノットグッド!できませんでした。' }
          end
        end
      end
      
    end
    
  end


  def destroy
    @vote = Vote.find(params[:id])
    @question = Question.find(params[:question_id])
    
    unless @vote.answer.present?
      @vote.destroy
      respond_to do |format|
        if params[:vote] == "posi"
          format.html { redirect_to question_path(@question), notice: '質問のグッド!を解除しました。' }
        else
          format.html { redirect_to question_path(@question), notice: '質問のノットグッド!を解除しました。' }
        end
      end
    else
      @vote.destroy
      respond_to do |format|
        if params[:vote] == "posi"
          format.html { redirect_to question_path(@question), notice: '回答のグッド!を解除しました。' }
        else
          format.html { redirect_to question_path(@question), notice: '回答のノットグッド!を解除しました。' }
        end
      end
    end
    
  end
  
end
