object @message => :message

attributes :id, :content, :created_at, :updated_at

node :user do |message|
  partial('conversations/user', :object => message.user)
end