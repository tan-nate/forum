class CreateUserPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :user_places do |t|
      t.integer :user_id
      t.integer :place_id
    end
  end
end
