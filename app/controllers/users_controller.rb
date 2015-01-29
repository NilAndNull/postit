class UsersController < ApplicationController
  before_action :require_same_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @comments = @user.comments.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome to Postit!"
      log_in @user
      redirect_to root_url
    else
      render 'new'
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = 'Your profile was successfully updated!'
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end

  private
    
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

    def require_same_user
      if current_user != User.find(params[:id])
        flash[:danger] = "You are not allowed to edit other user."
        redirect_to root_url
      end
    end
end
