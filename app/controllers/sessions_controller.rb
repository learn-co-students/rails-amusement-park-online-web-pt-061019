require 'pry'
class SessionsController < ApplicationController
    def new
    end

    def create
        binding.pry
        session[:user_id] = params[:user_id]
    end
end