class AddPayingFlagToGuest < ActiveRecord::Migration
  def change
    add_column :invitations, :paying, :boolean, default: false
  end
end
