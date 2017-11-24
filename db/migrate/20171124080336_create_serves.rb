class CreateServes < ActiveRecord::Migration[5.0]
  def change
    create_table :serves do |t|
      t.date :date
      t.string :checkin_time
      t.string :checkout_time
      t.belongs_to :member

      t.timestamps
    end
  end
end
