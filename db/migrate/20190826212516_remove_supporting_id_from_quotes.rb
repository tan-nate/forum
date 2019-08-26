class RemoveSupportingIdFromQuotes < ActiveRecord::Migration[6.0]
  def change

    remove_column :quotes, :supporting_id, :integer
  end
end
