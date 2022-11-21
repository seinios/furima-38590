class  BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @consumer_buyer = ConsumerBuyer.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @consumer_buyer = ConsumerBuyer.new(consumer_params)
    if @consumer_buyer.valid?
      @consumer_buyer.save
      binding.pry
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def consumer_params
    params.require(:consumer_buyer).permit(:post_code,:address_id,:municipality,:address_number,:building,:tel).merge(item_id: @item.id,user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
