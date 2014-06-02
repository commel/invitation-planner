class Event < ActiveRecord::Base
  
  has_many :invitations, -> { order(name: :asc) }
  
end
