module Blog
  class PostsController < Blog::BaseController
    load_and_authorize_resource :find_by => :slug, except: [:index]

    def index
      @posts = Post.published.page(params[:page]).includes([:author, :rich_text_body]).per(10)
      @recent_users = User.last(4)
    end

    def create
      @post.author = current_user

      if @post.save
        redirect_to post_path(@post), notice: 'Post was successfully created.'
      else
        flash.now[:alert] = 'Post was not created.'
        render :new
      end
    end

    def update
      if @post.update(post_params)
        redirect_to post_path(@post), notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      if @post.destroy
        redirect_to posts_path, notice: 'Post was successfully destroyed.'
      else
        render :show
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :body, :image, :excerpt, :draft)
    end
  end
end