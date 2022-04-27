class ItemsController < ApplicationController
  def top
  end

  def about
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, notice: "successfully delete"
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :body)
  end

end
