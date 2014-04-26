class AddReferenceToInvitation < ActiveRecord::Migration
  def change
    add_reference :invitations, :event
  end
end
