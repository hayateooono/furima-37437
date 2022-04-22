class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :pay_for_sipping
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image
  
  validates :name,presence: true, length: { maximum: 40 }
  validates :info,presence: true,length: { maximum: 1000 }
  validates :price, presence: true,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
  format: { with: /\A[0-9]+\z/ }
  validates :category_id, numericality: { other_than: 0 ,message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 0 ,message: "can't be blank"} 
  validates :pay_for_sipping_id, numericality: { other_than: 0 ,message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 0 ,message: "can't be blank"} 
  validates :shipping_day_id, numericality: { other_than: 0 ,message: "can't be blank"} 
  validates :image,presence: true
end
