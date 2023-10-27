class PostsController < ApplicationController
  def index
     @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end


  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :category, :content, :images, :user_id)
  end
end
