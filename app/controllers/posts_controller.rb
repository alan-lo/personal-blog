class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, except: [:index]
  before_action :authorize, only: [:edit, :destroy, :update]

  def index
   @posts = Post
    .select("id","title","body", "user_id", "image", "created_at", "updated_at", "count(likes.id)")
    .joins("LEFT JOIN likes on likes.post_id = posts.id")
    .group("posts.id")
    .order("count DESC")
   @most_liked = Post
     .select("id","title","body", "user_id", "image", "created_at", "updated_at", "count(posts.id) as counts")
     .joins(:likes)
     .group("posts.id")
     .order("counts DESC")
  end

  def new
    @post = Post.new
  end

  def create
       @post = Post.create(post_params)
       @category = Category.find(@post.category_id)
       @post.category = @category
       @post.user = current_user
      if @post.save
        redirect_to post_path(@post), notice: 'Post created!';
      else
        render :new
      end
  end

  def edit
  end

  def update
      @post = Post.find params[:id]
      if @post.update(post_params)
        redirect_to post_path(@post)
      else
        render :edit
      end
  end

  def show
      @category = Category.find(@post.category_id)
      @comment = Comment.new
  end

  def destroy
  @post.destroy
  redirect_to posts_path, notice: 'Post deleted!'
  end

  private
  def  post_params
    params.require(:post).permit([:title, :body, :image, :category_id, :user_id])
  end

  def find_post
    @post = Post.find params[:id]
  end

  def authorize
    if cannot?(:manage, @post)
      redirect_to posts_path, alert: 'Not authorized!'
    end
  end
end
