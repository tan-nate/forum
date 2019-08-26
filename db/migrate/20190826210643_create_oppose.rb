class CreateOppose < ActiveRecord::Migration[6.0]
  def change
    create_table :opposes do |t|
      t.integer :opposer_id
      t.integer :opposee_id
    end
  end
end
