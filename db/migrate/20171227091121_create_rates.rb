class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.float :point
      t.references :film, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
