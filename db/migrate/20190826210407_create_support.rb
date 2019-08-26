class CreateSupport < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      t.integer :supporter_id
      t.integer :supportee_id
    end
  end
end
