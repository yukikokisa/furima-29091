class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_message, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_player_id, :shipping_area_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_message
    @item = Item.find(params[:id])
  end
end
