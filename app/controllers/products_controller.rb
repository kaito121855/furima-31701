class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private

def product_params
  params.require(:product).permit(:image, :name, :explanation, :category_id, :status_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
end