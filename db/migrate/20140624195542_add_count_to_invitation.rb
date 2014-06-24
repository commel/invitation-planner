class AddCountToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :qty, :integer, default: 1
  end
end
