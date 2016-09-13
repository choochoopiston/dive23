class VotesController < ApplicationController
  
  def create
    @vote = current_user.votes.build
    
    if params[:answer_id].present?
      @vote.answer_id = params[:answer_id]
      @answer = @vote.answer
      @question = @answer.question
      
      if params[:vote] == "posi"
        @vote.is_positive = true
        @answer.posi_counts += 1
        
        Vote.transaction do
          @vote.save!
          @answer.save!
        end
        
        respond_to do |format|
          format.html { redirect_to question_path(@question), notice: '回答にプラス投票をしました。' }
        end
        
      elsif params[:vote] == "nega"
        @vote.is_positive = false
        @answer.nega_counts += 1
        
        Vote.transaction do
          @vote.save!
          @answer.save!
        end
          
        respond_to do |format|
          format.html { redirect_to question_path(@question), notice: '回答にマイナス投票をしました。' }
        end
      end

    else
      @vote.question_id = params[:question_id]
      @question = @vote.question
      
      if params[:vote] == "posi"
        @vote.is_positive = true 
        @question.posi_counts += 1
        
        Vote.transaction do
          @vote.save!
          @question.save!
        end
        
        respond_to do |format|
          format.html { redirect_to question_path(@question), notice: '質問にプラス投票をしました。' }
        end
        
      elsif params[:vote] == "nega"
        @vote.is_positive = false
        @question.nega_counts += 1
        
        Vote.transaction do
          @vote.save!
          @question.save!
        end
        
        respond_to do |format|
          format.html { redirect_to question_path(@question), notice: '質問にマイナス投票をしました。' }
        end

      end

      
    end
    
  end


  def destroy
    @vote = Vote.find(params[:id])
    @question = Question.find(params[:question_id])
    
    if @vote.answer.present?
      @answer = Answer.find(params[:answer_id])
      if params[:vote] == "posi"
        @answer.posi_counts -= 1
        
        Vote.transaction do
          @vote.destroy!
          @answer.save!
        end
        
        respond_to do |format|
          format.html { redirect_to question_path(@question), notice: '回答のプラス投票を解除しました。' }
        end
      elsif params[:vote] == "nega"
        @vote.is_positive = false
        @answer.nega_counts -= 1
        
        Vote.transaction do
          @vote.destroy!
          @answer.save!
        end
        
        respond_to do |format|
          format.html { redirect_to question_path(@question), notice: '回答のマイナス投票を解除しました。' }
        end
      end 
    
    else
      if params[:vote] == "posi"
        @question.posi_counts -= 1
        
        Vote.transaction do
          @vote.destroy!
          @question.save!
        end
        
        respond_to do |format|
          format.html { redirect_to question_path(@question), notice: '質問のプラス投票を解除しました。' }
        end
        
      elsif params[:vote] == "nega"
        @question.nega_counts -= 1
        
        Vote.transaction do
          @vote.destroy!
          @question.save!
        end
        
        respond_to do |format|
          format.html { redirect_to question_path(@question), notice: '質問のマイナス投票を解除しました。' }
        end
      end 
      
    end
    
  end
  
end
