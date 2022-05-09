class ShippingAddress < ApplicationRecord
  has_one :order
end
