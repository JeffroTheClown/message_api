class ConversationsController < ApplicationController

  def index
    @conversations = @current_user.conversations
    respond_with @conversations
  end

  def show
    @conversation = Conversation.find(params[:id])
    raise NotPrivileged unless @conversation.is_member?(@current_user)
    respond_with @conversation
  end

  def create
    @conversation = Conversation.new
    @invited_user = User.find(params[:user_id])
    raise NotPrivileged if @current_user.id == @invited_user.id
    @conversation.name = params[:name]
    @invited_user.conversations <<(@conversation) if @invited_user
    @current_user.conversations <<(@conversation)
    respond_with @conversation
  end

  def update
    @conversation = Conversation.find(params[:id])
    raise NotPrivileged unless @conversation.is_member?(@current_user)
    @conversation.name = params[:name] || @conversation.name
    @conversation.save!
    respond_with @conversation
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    raise NotPrivileged unless @conversation.is_member?(@current_user)
    @conversation.destroy
    respond_with @conversation
  end

end
