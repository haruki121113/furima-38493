class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :new, :create, :show, :search]


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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  def search
    @items = Item.search(params[:keyword]).order(id: "DESC")
  end

  private 
  def item_params
    params.require(:item).permit(:merchandise_name, :merchandise_explanation, :merchandise_category_id, :merchandise_condition_id, :delivery_charge_id, :area_id, :time_to_ship_id, :merchandise_price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if (current_user.id != @item.user.id) || Order.exists?(item_id: @item.id)
      redirect_to action: :index
    end
  end

  def item_find
    @item = Item.find(params[:id])
  end

end
