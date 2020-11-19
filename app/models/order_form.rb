class OrderForm
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id ,:municipality, :address, :building, :telephone, :user_id, :product_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipality
    validates :address
    validates :telephone, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    order = Order.create(product_id: product_id, user_id: user_id)
    Residence.create(postal_code: postal_code, prefecture_id: prefecture_id ,municipality: municipality, address: address, building: building, telephone: telephone, order_id: order.id)
  end
end