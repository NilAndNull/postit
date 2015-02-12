class UsersController < ApplicationController
  before_action :require_same_user, only: [:edit, :update]

  def show
    @user = User.find_by(slug: params[:slug])
    @posts = @user.posts.order(created_at: :desc)
    @comments = @user.comments.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.json { render json: @user }
      format.xml  { render xml:  @user }
    end
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
    @user = User.find_by(slug: params[:slug])
  end

  def update
    @user = User.find_by(slug: params[:slug])

    if @user.update(user_params)
      flash[:success] = 'Your profile was successfully updated!'
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :time_zone)
    end

    def require_same_user
      if current_user != User.find_by(slug: params[:slug])
        flash[:danger] = "You are not allowed to edit other user."
        redirect_to root_url
      end
    end
end
