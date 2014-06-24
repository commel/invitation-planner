class GuestState < ActiveRecord::Base
  
  has_many :invitations
  
end
