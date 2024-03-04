require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address)
  end

  describe '購入情報の保存' do
    context '購入情報が正しく保存される場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_shipping_address).to be_valid
      end
      it '建物名は空でも保存されること' do
        @purchase_shipping_address.address_line2 = ''
        expect(@purchase_shipping_address).to be_valid
      end 
    end

    context '購入情報が正しく保存されない場合' do
      it '郵便番号が必須であること' do
        @purchase_shipping_address.postal_code = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が正しい形式でないと保存できないこと' do
        @purchase_shipping_address.postal_code = '1234567'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が必須であること' do
        @purchase_shipping_address.prefecture_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が必須であること' do
        @purchase_shipping_address.city = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @purchase_shipping_address.address_line1 = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Address line1 can't be blank")
      end

      it '電話番号が必須であること' do
        @purchase_shipping_address.phone_number = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が正しい形式でないと保存できないこと' do
        @purchase_shipping_address.phone_number = '090-1234-5678'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @purchase_shipping_address.token = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
