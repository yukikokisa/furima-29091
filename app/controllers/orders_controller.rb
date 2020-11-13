class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderAddress.create(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end
end
