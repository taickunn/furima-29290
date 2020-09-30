class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  #before_action :correct_current_user, only: [:index]

  def index
    @item = Item.find(params[:item_id])
  end

def create
  @order = SoldItem.new(sold_params)
  @item = Item.find(params[:item_id])
  
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
  Payjp.api_key = "sk_test_4afa32f5a23bfc751795fc73"
  Payjp::Charge.create(
    amount: @item.price,
    card: sold_params[:token],
    currency:'jpy'
  )
end

end
