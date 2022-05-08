class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address , :building_name, :phone_number, :order_id, :user_id, :item_id,:token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は3桁ハイフン4桁の半角文字にしてください"}
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数値にしてください" }
    validates :prefecture_id, numericality:{other_than: 0}
    validates :user_id
    validates :token
  end

  def save
   order = Order.create(user_id: user_id, item_id: item_id)
   ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id,city: city,address: address,building_name: building_name,phone_number: phone_number, order_id: order.id)
  end
end