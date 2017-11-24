class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :code
      t.string :firstname
      t.string :lastname
      t.string :nickname
      t.string :member_type
      t.string :bdate
      t.string :regisdate
      t.string :expdate
      t.integer :pc_amount
      t.integer :pc_balance
    end
  end
end
