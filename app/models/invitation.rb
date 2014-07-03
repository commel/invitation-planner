class Invitation < ActiveRecord::Base
  
  belongs_to :event
  belongs_to :guest_state
  
  def update_paying_state
    if guest_state.code == 'accepted'
      self.paying = true
    end
    
    if guest_state.code == 'declined'
      self.paying = false
    end
  end
  
end
