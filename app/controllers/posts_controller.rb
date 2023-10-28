class PostsController < ApplicationController
  include Pundit
  require 'pry'

  def index
     @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
    @comment = Comment.new
    @comments = @post.comments.all
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    authorize @post

    if @post.save
      @post.image.attach(params[:post][:images])
      @post.video.attach(params[:post][:video])
      redirect_to root_path, notice: "Le post a été créé avec succès."
    else
      render 'new'
    end
  end


  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :category, :content)
  end
end
