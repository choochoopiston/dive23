class VotesController < ApplicationController
  
  def create
    @vote = current_user.votes.build
    
    unless params[:answer_id].present?
      @vote.question_id = params[:question_id]
      @question = @vote.question
      
      if params[:vote] == "posi"
        @vote.is_positive = true 
        @question.posi_counts += 1
        respond_to do |format|
          if @vote.save
            format.html { redirect_to question_path(@question), notice: '質問にグッド!をしました。' }
          else
            format.html { redirect_to question_path(@question), notice: '質問にグッド!できませんでした。' }
          end
        end
      else
        @question.nega_counts += 1
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
        @answer.posi_counts += 1
        respond_to do |format|
          if @vote.save
            format.html { redirect_to question_path(@question), notice: '回答にグッド!をしました。' }
          else
            format.html { redirect_to question_path(@question), notice: '回答にグッド!できませんでした。' }
          end
        end
      else
        respond_to do |format|
          @answer.nega_counts += 1
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
    
      if params[:vote] == "posi"
        @question.posi_counts -= 1
        @vote.destroy
        respond_to do |format|
          format.html { redirect_to question_path(@question), notice: '質問のグッド!を解除しました' }
        end
      else
        @question.nega_counts -= 1
        @vote.destroy
        respond_to do |format|
          format.html { redirect_to question_path(@question), notice: '質問のノットグッド!を解除しました' }
        end
      end 
    
    else
      @answer = Vote.find(params[:answer_id])
      if params[:vote] == "posi"
        @answer.posi_counts -= 1
        @vote.destroy
        respond_to do |format|
          format.html { redirect_to question_path(@question), notice: '回答のグッド!を解除しました' }
        end
      else
        @answer.nega_counts -= 1
        @vote.destroy
        respond_to do |format|
          format.html { redirect_to question_path(@question), notice: '回答のノットグッド!を解除しました' }
        end
      end 
      
    end
    
  end
  
end
