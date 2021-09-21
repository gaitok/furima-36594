class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :specified_item, only: [:show, :edit, :update]
  before_action :specified_user, only: [:edit]

  def index
    @items = Item.order('created_at')
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
    @items = Item.find(params[:id])
  end

  def update
    @items = Item.find(params[:id])
    if @items.update(items_params)
      redirect_to item_path(@items.id)
    else
      render :edit
    end
  end

  # def destroy
  # end

  private

  def items_params
    params.require(:item).permit(:title, :text, :category_id, :status_id, :price, :postage_id, :place_id, :day_id,
                                 :image).merge(user_id: current_user.id)
  end

  def specified_item
    @items = Item.find(params[:id])
  end

  def specified_user
    redirect_to root_path unless @items.user.id == current_user.id
  end
end
