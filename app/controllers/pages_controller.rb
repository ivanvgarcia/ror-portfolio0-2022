class PagesController < ApplicationController

  def home
    @posts = Post.last(5)
  end

end
