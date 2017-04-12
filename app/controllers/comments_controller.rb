class CommentsController < ApplicationController

  def create
    comment_params    = params.require(:comment).permit(:body)
    @comment          = Comment.new comment_params
    @comment.post     = Post.find params[:post_id]
    @comment.user     = current_user
    if @comment.save
      CommentsMailer.notify_post_owner(@comment).deliver_later
      redirect_to post_path(params[:post_id]), notice: 'Post created!'
    else
      flash[:alert] = 'Please fix errors'
      render 'posts/show'
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to post_path(@comment.post_id), notice: 'Post Deleted!'
   end
end
