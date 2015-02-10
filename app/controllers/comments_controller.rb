class CommentsController < ApplicationController
  include CastVotes

  before_action :require_authentication, only: [:create]

  def create
    @post = Post.find_by(slug: params[:post_slug])

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

  def vote
    @comment = Comment.find(params[:id])
    @vote = cast_vote(@comment)

    if @vote.valid?
      message = 'Your vote was successfully casted!'

      respond_to do |format|
        format.html { flash[:success] = message }
        format.js { flash.now[:success] = message }
      end
    else
      message = "You have already cast a vote. You can't cast more than one vote."

      respond_to do |format|
        format.html { flash[:danger] = message }
        format.js { flash.now[:danger] = message }
      end
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render partial: 'votes/vote', locals: {voteable: @comment} }
    end

  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end

end
