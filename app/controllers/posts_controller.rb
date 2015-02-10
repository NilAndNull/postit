class PostsController < ApplicationController
  include CastVotes

  before_action :require_authentication, except: [:index, :show]

  def index
    @posts = Post.order(created_at: :desc).all
  end

  def show
    @post = Post.find_by(slug: params[:slug])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      flash[:success] = 'Your post was successfully created!'
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find_by(slug: params[:slug])
  end

  def update
    @post = Post.find_by(slug: params[:slug])

    if @post.update(post_params)
      flash[:success] = 'Your post was successfully updated!'
      redirect_to post_url(@post)
    else
      render 'edit'
    end
  end

  def vote
    @post = Post.find_by(slug: params[:slug])
    @vote = cast_vote(@post)

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
      format.js { render partial: 'votes/vote', locals: {voteable: @post} }
    end

  end

  private

    def post_params
      params.require(:post).permit(:title, :url, :description, category_ids: [])
    end

end
