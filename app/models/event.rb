class Event < ActiveRecord::Base
  
  has_many :invitations, -> { order(name: :asc) }
  has_many :costs

  def statistics
    self.invitations.select("sum(qty) as qty, guest_state_id as guest_state_id")
                    .group("guest_state_id")
                    .order(qty: :desc) 
                    .map{|n| { 
                               :qty => n.qty, 
                               :state => GuestState.find(n.guest_state_id).label 
                             }
                    }
  end

end
