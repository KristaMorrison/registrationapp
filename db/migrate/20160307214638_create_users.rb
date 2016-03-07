class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first
      t.string :last
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end
