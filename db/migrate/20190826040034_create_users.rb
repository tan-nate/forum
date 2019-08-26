class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :points
      t.string :password_digest

      t.timestamps
    end
  end
end
