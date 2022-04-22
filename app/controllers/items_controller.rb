class ItemsController < ApplicationController
  before_action :authenticate_user!,  except: [:index]
  #before_action :set_item, only: [:show]
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

    def show
      #@item = Item.find(params[:id])
    end

  end

  private

  def item_params
    params.require(:item).permit(:name,:info,:price,:category_id,:condition_id,:pay_for_sipping_id,:prefecture_id,:shipping_day_id,:image,:user).merge(user_id: current_user.id)
  end

  #def set_item
    #@item = Item.find(params[:id])
  #end
end
