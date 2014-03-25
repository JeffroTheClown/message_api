class MeController < ApplicationController

  def index
    respond_with @current_user
  end

  def update
    @current_user.password = params[:password]
    @current_user.save!
    respond_with @current_user
  end

end
