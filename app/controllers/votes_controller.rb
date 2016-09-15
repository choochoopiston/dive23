class VotesController < ApplicationController
  before_action :set_question, only: [:create, :update, :destroy]
  before_action :set_vote, only: [:update, :destroy]
  
  def create
    @vote = current_user.votes.build
    respond_to do |format|
      begin
        ActiveRecord::Base.transaction do
          if params[:answer_id].present?
            @answer = Answer.find(params[:answer_id])
            @vote.answer_id = params[:answer_id]
            vote_create(@vote, @answer, params[:vote])
          else
            @vote.question_id = params[:question_id]
            vote_create(@vote, @question, params[:vote])
          end
        end
        format.html { redirect_to question_path(@question), notice: "#{question_or_answer(@vote)}" + "に" + "#{plus_or_minus(params[:vote])}" + "投票しました。"}
      rescue => e
        format.html { redirect_to question_path(@question), notice: "投票が正常にできませんでした。" }
        Rails.logger.error e.message
        Rails.logger.error e.backtrace.join("\n")
      end
    end
  end
  
  
  def update
    respond_to do |format|
      begin
        ActiveRecord::Base.transaction do
          if params[:answer_id].present?
            @answer = Answer.find(params[:answer_id])
            vote_change(@vote, @answer, params[:vote])
          else
            vote_change(@vote, @question, params[:vote])
          end
        end
        format.html { redirect_to question_path(@question), notice: "#{question_or_answer(@vote)}" + "の" + "#{plus_or_minus_reverse(params[:vote])}" + "投票を解除し、" + "#{plus_or_minus(params[:vote])}" + "投票しました。"}
      rescue => e
        format.html { redirect_to question_path(@question), notice: '投票の変更が正常にできませんでした。' }
        Rails.logger.error e.message
        Rails.logger.error e.backtrace.join("\n")
      end
    end
  end


  def destroy
    respond_to do |format|
      begin
        ActiveRecord::Base.transaction do
          if params[:answer_id].present?
            @answer = Answer.find(params[:answer_id])
            vote_destroy(@vote, @answer, params[:vote])
          else
            vote_destroy(@vote, @question, params[:vote])
          end
        end
        format.html { redirect_to question_path(@question), notice: "#{question_or_answer(@vote)}" + "の" + "#{plus_or_minus(params[:vote])}" + "投票を解除しました。"}
      rescue => e
        format.html { redirect_to question_path(@question), notice: '投票の解除が正常にできませんでした。' }
        Rails.logger.error e.message
        Rails.logger.error e.backtrace.join("\n")
      end
    end
  end
  
  private
  
    def set_vote
      @vote = Vote.find(params[:id])
    end
    
    def set_question
      @question = Question.find(params[:question_id])
    end

    def vote_create(vote, question_or_answer, posi_or_nega)
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
  
    def vote_change(vote, question_or_answer, posi_or_nega)
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
  

    def vote_destroy(vote, question_or_answer, posi_or_nega)
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
