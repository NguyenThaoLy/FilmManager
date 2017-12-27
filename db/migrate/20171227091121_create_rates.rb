class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer :user_id
      t.integer :film_id
      t.float :point

      t.timestamps
    end
  end
end
