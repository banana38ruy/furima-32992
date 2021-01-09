class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy] 
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    unless current_user.id == @item.user.id
      redirect_to root_path
    else
      @item.destroy
      redirect_to root_path
    end
  end
   

  def edit
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render action: :edit
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:image,:name,:expranation,:category_id,:price,:quality_id,:delivery_burden_id,:prefecture_id,:shipping_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end



