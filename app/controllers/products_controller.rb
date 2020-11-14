class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Product.new
  end
end
