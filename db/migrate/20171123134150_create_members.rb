class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :code
      t.string :firstname
      t.string :lastname
      t.string :nickname
      t.string :member_type
      t.date :bdate
      t.date :regisdate
      t.date :expdate
      t.integer :pc_amount
      t.integer :pc_balance

      t.timestamps
    end
  end
end
