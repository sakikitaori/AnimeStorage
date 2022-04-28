class ItemsController < ApplicationController
  def top
  end

  def about
  end

  def index
    @items = Item.page(params[:page]).per(10)
    @tag_list=Tag.all
  end

  def show
    @item = Item.find(params[:id])
    @post_comment = PostComment.new
    @item_tags = @item.tags
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    # 受け取った値を,で区切って配列にする
    tag_list=params[:item][:name].split(',')
    if @item.save
      @item.save_tag(tag_list)
      redirect_to items_path,notice:'投稿完了!'
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, notice: "successfully delete"
  end

  def edit
  end

  def search_tag
    # 検索結果画面でもタグ一覧表示
    @tag_list=Tag.all
    # 検索されたタグを受け取る
    @tag=Tag.find(params[:tag_id])
    # 検索されたタグに紐づく投稿を表示
    @items=@tag.items.page(params[:page]).per(10)
  end

  def tag_index
    @tag_list=Tag.all
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :body)
  end

end
