object @conversation => :conversation

attributes :id, :name

node :users do |conversation|
  partial('conversations/user', :object => conversation.users)
end