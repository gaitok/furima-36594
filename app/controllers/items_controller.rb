class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    # @items = Item.all
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

  # def show
  # end

  # def edit
  # end

  # def update
  #   if current_user.update(user_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  # end

  private

  def items_params
    params.require(:item).permit(:title, :text, :category_id, :status_id, :price, :postage_id, :place_id, :day_id,
                                 :image).merge(user_id: current_user.id)
  end
end
