class PostsController < ApplicationController
  include Pundit::Authorization

  def index
     @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    skip_authorization
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
      @post.image.attach(params[:post][:image])
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

    if @post.update(post_params)
      # Utilisez Turbo Streams pour mettre à jour la fenêtre Turbo Frame dans la vue d'édition
      redirect_to root_path, notice: "Le post a été mis à jour avec succès."
    else
      # Redirige vers l'action d'édition en cas d'erreur
      render :edit
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    authorize @post
    redirect_to root_path, notice: "L'article a été supprimé avec succès."
  end

  private

  def post_params
    params.require(:post).permit(:title, :category, :content, :image) # Ajoutez d'autres attributs autorisés si nécessaire
  end
end
