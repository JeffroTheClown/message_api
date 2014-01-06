object @conversation => :conversation

attributes :id, :name, :created_at, :updated_at

node :users do |conversation|
  partial('conversations/user', :object => conversation.users)
end