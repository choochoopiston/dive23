class VotesController < ApplicationController
  before_action :set_question, only: [:create, :update, :destroy]
  before_action :set_vote, only: [:update, :destroy]
  
  def create
      @vote = current_user.votes.build
      Vote.transaction do
        if params[:answer_id].present?
          @answer = Answer.find(params[:answer_id])
          @vote.answer_id = params[:answer_id]
          create_save(@vote, @answer, params[:vote])
        else
          @vote.question_id = params[:question_id]
          create_save(@vote, @question, params[:vote])
        end
      end
      
      respond_to do |format|
        format.html { redirect_to question_path(@question), notice: "#{question_or_answer(@vote)}" + "に" + "#{plus_or_minus(params[:vote])}" + "投票しました。"}
      end
    
    rescue
      respond_to do |format|
        format.html { redirect_to question_path(@question), notice: "投票が正常にできませんでした。" }
      end
  end
  
  
  def update
      Vote.transaction do
        if params[:answer_id].present?
          @answer = Answer.find(params[:answer_id])
          update_save(@vote, @answer, params[:vote])
        else
          update_save(@vote, @question, params[:vote])
        end
      end
      respond_to do |format|
        format.html { redirect_to question_path(@question), notice: "#{question_or_answer(@vote)}" + "の" + "#{plus_or_minus_reverse(params[:vote])}" + "投票を解除し、" + "#{plus_or_minus(params[:vote])}" + "投票しました。"}
      end
    rescue
      respond_to do |format|
        format.html { redirect_to question_path(@question), notice: '投票の変更が正常にできませんでした。' }
      end
  end


  def destroy
      Vote.transaction do
        if params[:answer_id].present?
          @answer = Answer.find(params[:answer_id])
          destroy_save(@vote, @answer, params[:vote])
        else
          destroy_save(@vote, @question, params[:vote])
        end
      end
      respond_to do |format|
        format.html { redirect_to question_path(@question), notice: "#{question_or_answer(@vote)}" + "の" + "#{plus_or_minus(params[:vote])}" + "投票を解除しました。"}
      end
    rescue
      respond_to do |format|
        format.html { redirect_to question_path(@question), notice: '投票の解除が正常にできませんでした。' }
      end
  end
  
  private
  
    def set_vote
      @vote = Vote.find(params[:id])
    end
    
    def set_question
      @question = Question.find(params[:question_id])
    end

    def create_save(vote, question_or_answer, posi_or_nega)
      if posi_or_nega == "posi"
        vote.is_positive = true
        question_or_answer.posi_counts += 1
        question_or_answer.user.score += 1
      elsif posi_or_nega == "nega"
        vote.is_positive = false
        question_or_answer.nega_counts += 1
        question_or_answer.user.score -= 1
      end
      vote.save!
      question_or_answer.save!
    end
  
    def update_save(vote, question_or_answer, posi_or_nega)
      if posi_or_nega == "posi"
        vote.is_positive = true
        question_or_answer.posi_counts += 1
        question_or_answer.nega_counts -= 1
        question_or_answer.user.score += 2
      elsif posi_or_nega == "nega"
        vote.is_positive = false
        question_or_answer.posi_counts -= 1
        question_or_answer.nega_counts += 1
        question_or_answer.user.score -= 2
      end
      vote.save!
      question_or_answer.save!
    end
  

    def destroy_save(vote, question_or_answer, posi_or_nega)
      if posi_or_nega == "posi"
        question_or_answer.posi_counts -= 1
        question_or_answer.user.score -= 1
      elsif posi_or_nega == "nega"
        question_or_answer.nega_counts -= 1
        question_or_answer.user.score += 1
      end
      vote.destroy!
      question_or_answer.save!
    end
    
    def question_or_answer(vote)
      vote.answer == nil ? "質問" : "回答"
    end 
  
    def plus_or_minus(vote)
      vote == "posi" ? "プラス" : "マイナス"
    end 
  
    def plus_or_minus_reverse(vote)
      vote == "posi" ? "マイナス" : "プラス"
    end 

end
