class CreateFilms < ActiveRecord::Migration[5.1]
  def change
    create_table :films do |t|
      t.string :name
      t.string :actor
      t.date :duration
      t.integer :time
      t.string :directors
      t.text :detail
      t.string :status
      t.string :poster
      t.string :trailer
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
