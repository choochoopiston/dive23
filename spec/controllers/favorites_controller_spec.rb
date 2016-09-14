require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
#TODO params[:question_id]をcontrollerテストでどの様に渡すかが分かるまで保留。
  # describe 'Transaction' do
  #   let(:user) {
  #     build(:user,id: 1)
  #   }
  
  #   it "should rollback if failed to save question" do
  #     # 質問の保存時時にスタンダードエラーをあげるスタブを定義
  #     allow_any_instance_of(Question).to receive(:save!).and_raise(StandardError)
  #     # current_userのスタブを定義
  #     allow(controller).to receive(:current_user).and_return(user)
  #     # createを実行した際にロールバックにより@favoriteの更新が巻き戻った事を確認
  #     expect {
  #       @controller.create
  #     }.not_to change(Favorite, :count)
  #   end
  # end
end
