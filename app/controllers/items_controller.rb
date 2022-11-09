class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name,:image,:explanation,:category_id,:situation_id,:delivery_charge_id,:address_id,:period_id,:price).merge(user_id: current_user.id)
  end
  
end 