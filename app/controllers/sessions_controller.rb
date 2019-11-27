class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
    # session[:user_id] =
    # redirect_to root_path
    #log in the user
  end

  def create
    # <ActionController::Parameters {"utf8"=>"✓", "authenticity_token"=>"ALvmAzqLlGaxwmLO/dunooJjukyxONKhn0gwTpG1G2c9nue6ZFVlba75CiLA4Vov9PJWk1MENEhyKaIJtR1vEA==", "user"=>{"id"=>"25"}, "commit"=>"Submit", "controller"=>"sessions", "action"=>"create"} permitted: false>
    # raise params.inspect
    @user = User.find_by(name: params["user"]["name"])
    session[:user_id] = @user.id
  end
end
