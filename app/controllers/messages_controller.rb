class MessagesController < ApplicationController

  def index
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages
    respond_with @messages
  end

  def show
    @conversation = Conversation.find(params[:conversation_id])
    raise NotPrivileged unless @conversation.is_member?(@current_user)
    @conversation.messages.each do |message|
      @message = message if message.id == params[:id].to_i
    end
    raise ActiveRecord::RecordNotFound if @message.nil?
    respond_with @message
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    raise NotPrivileged unless @conversation.is_member?(@current_user)
    @message = Message.new
    @message.content = params[:content]
    @message.user = @current_user
    @message.read = false
    @message.save!
    @conversation.messages << @message
    @conversation.save!
    respond_with @message
  end

  def update
    @conversation = Conversation.find(params[:conversation_id])
    raise NotPrivileged unless @conversation.is_member?(@current_user)
    @conversation.messages.each do |message|
      @message = message if message.id == params[:id].to_i
    end
    raise ActiveRecord::RecordNotFound if @message.nil?
    @message.content = params[:content]
    @message.read = false
    @message.save!
    @conversation.messages << message
    @conversation.save!
    respond_with @message
  end

  def destroy
    @conversation = Conversation.find(params[:conversation_id])
    raise NotPrivileged unless @conversation.is_member?(@current_user)
    @conversation.messages.each do |message|
      @message = message if message.id == params[:id].to_i
    end
    raise ActiveRecord::RecordNotFound if @message.nil?
    @message.destroy
  end

end
