class BuysController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :having_items, only: [:index, :create]
  before_action :specified_user, only: [:index,:new,:create]

  def index
    @buy_address = BuyAddress.new
  end

  def new
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_address_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_address_params
    params.require(:buy_address).permit(:postcode, :place_id, :city, :block, :building, :phone).merge(user_id: current_user.id,
                                                                                                      item_id: params[:item_id], token: params[:token])
  end

  def having_items
    @items = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = 'sk_test_78c1531b010b5bbc62131957'  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @items.price, # 商品の値段
      card: buy_address_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def specified_user
    if user_signed_in?
      if @items.user.id == current_user.id
        redirect_to root_path
      elsif Buy.find_by(item_id: @items.id) != nil
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end
