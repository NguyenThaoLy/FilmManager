class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :sex
      t.string :email
      t.string :address
      t.string :phone

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_column :users, :password_digest, :string
  end
end
