class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address , :building_name, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'Input only number' }
    validates :prefecture_id, numericality:{other_than: 0, message: "can't be blank"}
  end

  def save
   order = Order.create(user_id: user_id, item_id: item_id)
   OrderAddress.create(:post_code,:prefecture_id,:city,:address,:building_name,:phone_number,:order_id,order: order.id)
  end
end