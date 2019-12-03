class UsersController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login, only: [:index]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    if session.include? :user_id
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @user = current_user
    @user.take_ride

  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

  # def require_login
  #   return head(:forbidden) unless session.include? :user_id
  # end

end
