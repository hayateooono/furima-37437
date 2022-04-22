class ItemsController < ApplicationController
  def index
    #@item = Item.all
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
    end
    
  end

  private

  def item_params
    params.require(:item).permit(:name,:info,:price,:category_id,:condition_id,:pay_for_sipping_id,:prefecture_id,:shipping_day_id,:image).merge(user_id: current_user.id)
  end
end
