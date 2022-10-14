class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def order_params
    params.require(:order_address).permit(:receiving_postal_code, :area_id, :receiving_municipalities, :receiving_house_number, :receiving_building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.merchandise_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if (current_user.id == @item.user.id) || Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end
end
