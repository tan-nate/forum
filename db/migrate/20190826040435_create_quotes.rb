class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.string :text
      t.integer :fact_rating
      t.integer :relevant_rating
      t.integer :supporting_id
      t.integer :opposing_id
      t.integer :user_id

      t.timestamps
    end
  end
end
