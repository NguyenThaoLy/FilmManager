class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.string :content
      t.integer :film_id

      t.timestamps
    end
  end
end
