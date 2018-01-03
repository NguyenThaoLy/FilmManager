class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.date :date
      t.integer :amout
      t.integer :schedule_id
      t.integer :user_id

      t.timestamps
    end
  end
end
