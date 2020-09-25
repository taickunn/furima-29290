class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  #before_action :correct_current_user, only: [:index]

  def index
    @order = Order.all
  end

def create
end

private

#def correct_current_user
    #redirect_to root_path  current_user.id == @item.user_id
#end

end
