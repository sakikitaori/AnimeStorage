class UsersController < ApplicationController

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items.page(params[:page]).per(10)
    @tag_list=Tag.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.page(params[:page]).per(10)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def withdrawal
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:is_deleted)
  end

end
