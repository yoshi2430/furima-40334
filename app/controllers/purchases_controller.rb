class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index]
  before_action :find_item, only: [:index, :create]
  before_action :redirect_if_conditions_met, only: [:index, :create]
  before_action :set_gon_public_key, only: [:index, :create]


  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def new
    redirect_to root_path
  end

  def create
   @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    
     if @purchase_shipping_address.valid? 
        pay_item
        @purchase_shipping_address.save(current_user)
        redirect_to root_path
     else
        render :index, status: :unprocessable_entity
     end
  end

  
  private


  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :prefecture_id, :city, :address_line1, :address_line2, :phone_number, :purchase).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'   
        )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_conditions_met
    redirect_to root_path if current_user == @item.user || @item.purchase.present?
  end

  def set_gon_public_key
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end
end
