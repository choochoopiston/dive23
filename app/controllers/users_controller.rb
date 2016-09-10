class UsersController < ApplicationController
  def index
    @users = User.all.order(score: :desc, updated_at: :asc)
  end
end
