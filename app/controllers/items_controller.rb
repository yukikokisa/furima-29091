class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
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
    @category = Category.find(@item.category_id)
    @condition = Condition.find(@item.condition_id)
    @postage_player = PostagePlayer.find(@item.postage_player_id)
    @shipping_area = ShippingArea.find(@item.shipping_area_id)
    @shipping_date = ShippingDate.find(@item.shipping_date_id)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_player_id, :shipping_area_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
