class BuysController < ApplicationController
before_action :having_items, only: [:index]



  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:postcode,:place_id,:city,:block,:building,:phone).merge(user_id: current_user.id)
  end
  
  def having_items
    @items = Item.find(params[:item_id])
  end
end
