class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  def index
  end

  def create
  @order = SoldItem.new(sold_params)
  
    if @order.save
      pay_item
    return redirect_to root_path
    else
    render 'index'
    end
  redirect_to root_path
  end

    private

  def sold_params
  params.permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: sold_params[:token],
    currency:'jpy'
  )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
