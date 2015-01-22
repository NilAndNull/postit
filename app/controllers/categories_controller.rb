class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = 'The category was created successfully.'
      redirect_to posts_url
    else
      render 'new'
    end
  end

  # def edit
  #   @category = Category.find(params[:id])
  # end

  # def update
  #   @category = Category.find(params[:id])

  #   if @category.update(category_params)
  #     flash[:success] = 'The category was updated successfully.'
  #     redirect_to category_url
  #   else
  #     render 'edit'
  #   end
  # end

  # def destroy
  #   Category.find(params[:id]).destroy
  #   flash[:success] = 'The category was deleted successfully.'
  #   redirect_to posts_url
  # end

  private 

    def category_params
      params.require(:category).permit(:name)
    end
end
