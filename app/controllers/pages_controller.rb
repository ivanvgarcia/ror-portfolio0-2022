class PagesController < ApplicationController

  def home
    @posts = Post
              .latest_published
              .includes(image_attachment: :blob)
              .includes([:author, :rich_text_body])
  end

end
