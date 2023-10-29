class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @subscriber = Subscriber.new
    @user = current_user
    authorize @user
    @posts = Post.where(user_id: current_user.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    authorize @post
    redirect_to root_path, notice: "L'article a été supprimé avec succès."
  end
end
