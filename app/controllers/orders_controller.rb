class OrdersController < ApplicationController
  before_action :set_product, only: [:index, :create, :move_to_index_product]
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index_user, only: [:index]
  before_action :move_to_index_product, only: [:index]

  def index
    @order_form = OrderForm.new
  end

  def create
    # binding.pry
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      Payjp.api_key = "sk_test_ff68a3056119ddc5f9d5a815"
      Payjp::Charge.create(
        amount: @product.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :telephone).merge(token: params[:token], user_id: current_user.id, product_id: params[:product_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_index_user
    redirect_to root_path if current_user.id == @product.user_id
  end

  def move_to_index_product
    redirect_to root_path if @product.order.present?
  end

end