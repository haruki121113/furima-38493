class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  #before_action :move_to_index, except: [:index, :new, :create]

  def index
    @items = Item.all.order(id: "DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  private 
  def item_params
    params.require(:item).permit(:merchandise_name, :merchandise_explanation, :merchandise_category_id, :merchandise_condition_id, :delivery_charge_id, :area_id, :time_to_ship_id, :merchandise_price, :image).merge(user_id: current_user.id)
  end

end
