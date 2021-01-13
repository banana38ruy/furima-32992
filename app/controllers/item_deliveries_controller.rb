class ItemDeliveriesController < ApplicationController
  before_action :set_item_delivery, only: [:index, :create]
  before_action :authenticate_user!
  
  def index
     if current_user != @item.user && @item.item_delivery.blank?
      @user_delivery = UserDelivery.new   
     else
      redirect_to root_path
     end
  end



 
  def create  
    @user_delivery = UserDelivery.new(recoad_params)   
     if @user_delivery.valid?
      pay_item
       @user_delivery.save
       redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def recoad_params
   params.require(:user_delivery).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
       Payjp::Charge.create(
         amount: @item.price,
         card: recoad_params[:token],
         currency: 'jpy'
       )
  end

  def set_item_delivery
    @item = Item.find(params[:item_id])
  end

end

