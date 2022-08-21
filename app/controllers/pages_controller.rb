class PagesController < ApplicationController

  def home
    @posts = Post.where(draft: false).order(created_at: :desc).last(3)
  end

end
