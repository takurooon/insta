class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @favorites_blogs = @user.favorite_blogs
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path(@user.id)
    else
      render "new"
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
