class TagsController < ApplicationController
  def index
    case params[:tab]
    when "name"
      @tags = Tag.all.order(name: :asc)
    when "new"
      @tags = Tag.all.order(created_at: :desc)
    else
      @tags = Tag.all.order(name: :asc)
    end
  end
end
