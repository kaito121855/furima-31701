class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :move_to_index]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @products = Product.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @product.destroy
  end
end

private

def product_params
  params.require(:product).permit(:image, :name, :explanation, :category_id, :status_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
end

def move_to_index
  redirect_to action: :index unless current_user.id == @product.user_id
end

def set_product
  @product = Product.find(params[:id])
end
