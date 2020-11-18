class OrdersController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to "/products/#{@order_form.product.id}"
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id ,:municipality, :address, :building, :telephone, :purchase).merge(token: params[:token], user_id: current_user.id, product_id: params[:product_id])
  end

end