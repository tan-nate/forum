class RemoveRelevantRatingFromQuotes < ActiveRecord::Migration[6.0]
  def change

    remove_column :quotes, :relevant_rating, :integer
  end
end
