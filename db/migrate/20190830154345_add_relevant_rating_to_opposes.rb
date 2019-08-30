class AddRelevantRatingToOpposes < ActiveRecord::Migration[6.0]
  def change
    add_column :opposes, :relevant_rating, :integer
  end
end
