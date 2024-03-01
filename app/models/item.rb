class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :category
   belongs_to :condition
   belongs_to :shipping_fee_burden
   belongs_to :prefecture
   belongs_to :shipping_day
  
  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_fee_burden_id, numericality: { only_integer: true, other_than: 1 }
  validates :prefecture_id, numericality: { only_integer: true, other_than: 1 }
  validates :shipping_day_id, numericality: { only_integer: true, other_than: 1 } 
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  
end
