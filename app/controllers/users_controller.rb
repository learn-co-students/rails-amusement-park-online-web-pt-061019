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

#     Parameters: {"utf8"=>"✓", "authenticity_token"=>"u/gLlAH6x8VaSqLjmTp9MDyb35pDgXxDZWWzJc89a1SC/qc6hzqpDRNJyEtdC9YZMUnbAqQ68uuwHLTyMux
# 9dg==", "user"=>{"name"=>"Shannon Crabill", "password"=>"[FILTERED]", "nausea"=>"100", "happiness"=>"1000", "tickets"=>"100", "height"
# =>"100", "admin"=>"0"}, "commit"=>"Create User"}
    @user = User.create(user_params)
    # binding.pry
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

  def mood
  end

  def first_ride
  end

  def destroy
    session[:user_id].delete
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
