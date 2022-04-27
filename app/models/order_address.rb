class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number,:order_id,:user_id,:item_id,:token

  with_options presence: true do
    validates :user_id
    validates :post_code, format: {with:/\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0,message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_number,numericality:{only_integer: true},length: { minimum: 10 , maximum:11},
    format: { with: /\A[0-9]+\z/ }
  end


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
