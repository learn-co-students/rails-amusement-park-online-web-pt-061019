class SessionsController < ApplicationController
    def new
    end 

    def create 
        user = user.find_by(id: params[:user_name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            render 'sessions/new'
        end
    end

    def destroy
        if current_user
            session.delete :user_id
            redirect_to root_path
        end 
    end 
end