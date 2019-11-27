class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user 
            # binding.pry
            session[:user_id] = @user.id
            redirect_to "/users/#{@user.id}"
        else
            redirect_to "/"
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params 
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end