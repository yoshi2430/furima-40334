class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :category
   belongs_to :Condition

  
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
end
