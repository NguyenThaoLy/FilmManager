class CreateFilms < ActiveRecord::Migration[5.1]
  def change
    create_table :films do |t|
      t.string :name
      t.string :product
      t.date :date
      t.integer :time
      t.string :directors
      t.text :detail
      t.string :status
      t.string :poster
      t.string :trailer
      t.integer :category_id

      t.timestamps
    end
  end
end
