class Users::RegistrationsController < Devise::RegistrationsController
  def destroy
    respond_to do |format|
      begin
        ActiveRecord::Base.transaction do
          # delete user.votes
          @user.votes.each do |v|
            if v.answer_id.blank?
              if v.is_positive?
                v.question.decrement(:posi_counts, 1).save!
              else
                v.question.decrement(:nega_counts, 1).save!
              end
            else
              if v.is_positive?
                v.answer.decrement(:posi_counts, 1).save!
              else
                v.answer.decrement(:nega_counts, 1).save!
              end
            end
            v.deleted_flg = true
            v.save!
          end
          # soft delete user (change user to Anonymous)
          @user.name = "匿名ユーザー"
          @user.remove_avatar = true
          @user.email = "deleted_" + @user.email
          @user.profile = ""
          @user.score = 0
          @user.deleted_flg = true
          @user.save!
          # sign out
          format.html { redirect_to users_sign_out_path, notice: 'ユーザーを削除しました。' }
        end
      rescue => e
        format.html { redirect_to edit_user_registration_path, notice: 'ユーザーの削除に失敗しました。' }
        Rails.logger.error e.message
        Rails.logger.error e.backtrace.join("\n")
      end
    end
  end
end
