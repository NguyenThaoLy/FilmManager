class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.time :time
      t.date :date
      t.integer :price
      t.integer :film_id

      t.timestamps
    end
  end
end
