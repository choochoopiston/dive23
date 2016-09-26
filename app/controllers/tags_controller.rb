class TagsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    if params[:tab] == "name"
      @tags = Tag.all.order(name: :asc)
    else
      @tags = Tag.all.order(created_at: :desc)
    end
  end
end
