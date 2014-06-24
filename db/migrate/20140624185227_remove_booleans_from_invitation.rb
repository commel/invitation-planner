class RemoveBooleansFromInvitation < ActiveRecord::Migration
  def change
    remove_column :invitations, :invited
    remove_column :invitations, :accepted
    remove_column :invitations, :payed
  end
end
