class CreateGuestStates < ActiveRecord::Migration
  def change
    create_table :guest_states do |t|
      t.string :code
      t.string :label
    end
    
    add_reference :invitations, :guest_state
  end
end
