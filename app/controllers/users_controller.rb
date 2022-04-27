class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.items
  end

  def edit
    @user = User.find(params[:id])
  end

  # def update
  #   if @user.update(user_params)
  #     redirect_to user_path(@user), notice: "You have updated user successfully."
  #   else
  #     render "edit"
  #   end
  # end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
