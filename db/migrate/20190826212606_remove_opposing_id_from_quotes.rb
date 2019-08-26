class RemoveOpposingIdFromQuotes < ActiveRecord::Migration[6.0]
  def change

    remove_column :quotes, :opposing_id, :integer
  end
end
