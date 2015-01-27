class CommentsController < ApplicationController
  before_action :require_authentication, only: [:create]

  def create
    @post = Post.find(params[:post_id])

    # Used this form, instead of @post.comments.new(comment_params), since it adds
    # comment object automatically to @post.comments collection, even if it's not
    # saved yet. 
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.creator = current_user

    if @comment.save
      flash[:success] = 'The comment was created successfully.'
      redirect_to post_url(@post)
    else
      render 'posts/show'
    end

  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end

end
