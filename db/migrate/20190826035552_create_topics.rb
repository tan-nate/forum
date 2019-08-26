class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :place_id

      t.timestamps
    end
  end
end
