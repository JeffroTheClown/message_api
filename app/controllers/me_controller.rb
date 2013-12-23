class MeController < ApplicationController

  def index
    respond_with @current_user
  end

  def update
    @current_user.username = params[:username]
    @current_user.password = params[:password]
    @current_user.email = params[:email]
    respond_with @current_user
  end

end
