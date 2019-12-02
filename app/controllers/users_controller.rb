class UsersController < ApplicationController
    # def index
    # end

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
            redirect_to "/"
        end
    end

    private

    def user_params 
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end