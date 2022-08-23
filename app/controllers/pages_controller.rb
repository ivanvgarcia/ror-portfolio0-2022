class PagesController < ApplicationController

  def home
    @posts = Post
              .where(draft: false)
              .order(created_at: :desc)
              .includes(image_attachment: :blob)
              .includes([:author, :rich_text_body])
              .last(3)
  end

end
