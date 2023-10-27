class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to @comment.post
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :rating, :post_id)
  end
end
