class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end
  def new
    @item = Product.new
  end
end
