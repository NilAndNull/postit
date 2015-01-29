class PostsController < ApplicationController
  include CastVotes

  before_action :require_authentication, except: [:index, :show]

  def index
    @posts = Post.order(created_at: :desc).all
  end

  def show
    @post = Post.find(params[:id])
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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = 'Your post was successfully updated!'
      redirect_to post_url(@post)
    else
      render 'edit'
    end
  end

  def vote
    @post = Post.find(params[:id])
    @vote = cast_vote(@post)

    if @vote.valid?
      flash[:success] = 'Your vote was successfully casted!'
      redirect_to :back
    else
      flash[:danger] = "You have already cast a vote. You can't cast more than one vote."
      redirect_to :back
    end

  end

  private

    def post_params
      params.require(:post).permit(:title, :url, :description, category_ids: [])
    end

end
