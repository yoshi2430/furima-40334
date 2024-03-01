class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index]
  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user || @item.purchase.present?
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def new
    redirect_to root_path
  end

  def create
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user || @item.purchase.present?

    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.save(current_user)
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  
  private


  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :prefecture_id, :city, :address_line1, :address_line2, :phone_number, :purchase).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
