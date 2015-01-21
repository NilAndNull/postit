class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
    # TODO: Change the line below to set the current logged in user instead
    @post.creator = User.first

    if @post.save
      flash[:success] = 'Your post was successfully created!'
      redirect_to posts_path
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
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :url, :description)
    end

end
