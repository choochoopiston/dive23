class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.build
    @favorite.question_id = params[:question_id]
    @question = @favorite.question
    @question.favorite_counts += 1
    
    respond_to do |format|
      begin
        ActiveRecord::Base.transaction do
          @favorite.save!
          @question.save!
        end
        format.html { redirect_to question_path(@question), notice: 'お気に入り登録しました。' }
      rescue => e
        format.html { redirect_to question_path(@question), notice: 'お気に入り登録できませんでした。' }
        Rails.logger.error e.message
        Rails.logger.error e.backtrace.join("\n")
      end
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @question = Question.find(params[:question_id])
    @question.favorite_counts -= 1
    
    respond_to do |format|
      begin
        ActiveRecord::Base.transaction do
          @question.save!
          @favorite.destroy!
        end
        format.html { redirect_to question_path(@question), notice: 'お気に入り解除しました。' }
      rescue => e
        format.html { redirect_to question_path(@question), notice: 'お気に入り解除できませんでした。' }
        Rails.logger.error e.message
        Rails.logger.error e.backtrace.join("\n")
      end
    end
  end
  
end
