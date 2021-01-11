class ItemDeliveriesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_delivery = UserDelivery.new   
  end
 
  def create
    @item = Item.find(params[:item_id])
    @user_delivery = UserDelivery.new(recoad_params)   
     if @user_delivery.valid?
       @user_delivery.save
       redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def recoad_params
   params.require(:user_delivery).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
# .merge(token: params[:token])
