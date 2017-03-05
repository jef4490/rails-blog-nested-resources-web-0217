class CommentsController < ApplicationController
  def create
    # binding.pry
    @comment = Comment.new(comment_params(params))
    params.permit(:post_id)
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to post_path(@comment.post_id)
  end

private
  def comment_params(params)
    params.require(:post).permit(:content)
  end
end
