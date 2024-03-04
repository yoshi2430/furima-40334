class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_id, :postal_code, :prefecture_id, :city, :address_line1, :address_line2, :phone_number, :token
  
  class PurchaseShippingAddress < ApplicationRecord
    with_options presence: true do
      validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
      validates :prefecture_id, :city, :address_line1, :phone_number, :token, :item_id, :user_id
    end
  
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :prefecture_id, numericality: { only_integer: true, other_than: 1 }
  end
  

  def save(user)
    return false unless valid?
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(purchase_id: purchase.id,
                           postal_code: postal_code,
                           prefecture_id: prefecture_id,
                           city: city,
                           address_line1: address_line1,
                           address_line2: address_line2,
                           phone_number: phone_number
    )
  end
end
