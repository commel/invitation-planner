class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.references :event
      t.string :description
      t.decimal :amount, precision: 8, scale: 2
      t.timestamps
    end
  end
end
