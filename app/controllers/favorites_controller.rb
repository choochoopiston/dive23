class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.build(favorite_params)
    @favorite.question_id = params[:question_id]
    @question = @favorite.question
    
    respond_to do |format|
      if @favorite.save
        format.html { redirect_to question_path(@question), notice: 'お気に入り登録しました。' }
      else
        format.html { redirect_to question_path(@question), notice: 'お気に入り登録できませんでした。' }
      end
    end
  end

  def destroy
    @favorite = Favorite.where(question_id: params[:question_id]).where(user_id: current_user.id)
    @question = @favorite.question
    @favorite.destroy
    
    respond_to do |format|
      format.html { redirect_to question_path(@question), notice: 'お気に入り解除しました。' }
    end
  end
  
  private
    def favorite_params
      params.require(:favorite).permit(:user_id, :question_id)
    end
end
