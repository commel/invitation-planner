class Event < ActiveRecord::Base
  
  has_many :invitations, -> { order(name: :asc) }
  has_many :costs

  def total_costs
    costs.sum(:amount)
  end
  
  def shared_costs
    total_costs / paying_guests
  end
  
  def paying_guests
    qty = invitations.where(paying: true).count
    qty == 0 ? 1 : qty
  end
   
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
