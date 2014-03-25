class Location < ActiveRecord::Base

  def sending_user
    User.find(self.sending_user_id)
  end

  def receiving_user
    User.find(self.receiving_user_id)
  end

end