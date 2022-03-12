class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @categories = Category.new(categories_params)

    if @categories.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @categories = Product.find params[:id]
    @categories.destroy
    redirect_to [:admin, :categories], notice: 'Category deleted!'
  end


  def categories_params
    params.require(:category).permit(:name)
  end

end
