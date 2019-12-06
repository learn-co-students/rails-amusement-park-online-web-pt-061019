class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        # binding.pry
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        if params[:ride_taker]
            @ride_taker = params[:ride_taker]
        end

        if session[:user_id] != @user.id
            redirect_to "/"
        end
    end

    


    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end