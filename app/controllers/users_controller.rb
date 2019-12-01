class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    if session[:user_id] != nil
      @user = User.find_by_id(params[:id])
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
    redirect_to user_path(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
