class ItemsController < ApplicationController
  before_action :authenticate_user!,  except: [:index,:show]
  before_action :set_item, only: [:edit, :show,:update,:destroy]
  before_action :move_to_index,only: [:edit,:destroy]
 
  def index
    @items = Item.all.order("created_at DESC")
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


  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end


  def show
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:name,:info,:price,:category_id,:condition_id,:pay_for_sipping_id,:prefecture_id,:shipping_day_id,:image,:user).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end
end
