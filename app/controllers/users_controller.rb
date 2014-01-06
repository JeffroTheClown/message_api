class UsersController < ApplicationController

  def index
    if params[:conversation_id]
      @users = Conversation.find(params[:conversation_id]).users
    else
      @users = User.all
    end
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    respond_with @user
  end

  def create
    if params[:conversation_id]
      @conversation = Conversation.find(params[:conversation_id])
      @user = User.find(params[:user_id])
      @conversation.users << @user
      @conversation.save!
      @user.save!
    else
      @user = User.new
      @user.username = params[:username]
      @user.password = params[:password]
      @user.email = params[:email]
      @user.last_seen = Time.now.iso8601
      @user.save!
    end
    respond_with @user
  end

end