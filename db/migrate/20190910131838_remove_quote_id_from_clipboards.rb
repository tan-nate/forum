class RemoveQuoteIdFromClipboards < ActiveRecord::Migration[6.0]
  def change

    remove_column :clipboards, :quote_id, :integer
  end
end
