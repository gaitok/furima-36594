class ItemsController < ApplicationController


  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(prototype_params)
    if @Item.save
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
  end

  def destroy
  end

  private

  def items_params
    params.require(:items).permit(:title, :text, :category_id, :status_id,:price,:postage_id,:place_id,:day_id).merge(user_id: current_user.id)
  end

end
