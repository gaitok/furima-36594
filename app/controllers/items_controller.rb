class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :specified_item, only: [:show, :edit, :update, :destroy]
  before_action :specified_user, only: [:edit]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(items_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @items.update(items_params)
      redirect_to item_path(@items.id)
    else
      render :edit
    end
  end

  def destroy
    @items.destroy
    redirect_to root_path
  end

  private

  def items_params
    params.require(:item).permit(:title, :text, :category_id, :status_id, :price, :postage_id, :place_id, :day_id,
                                 :image).merge(user_id: current_user.id)
  end

  def specified_item
    @items = Item.find(params[:id])
  end

  def specified_user
    if Buy.find_by(item_id: @items.id) != nil
      redirect_to root_path
    elsif @items.user.id != current_user.id
      redirect_to root_path
    end
  end
end
