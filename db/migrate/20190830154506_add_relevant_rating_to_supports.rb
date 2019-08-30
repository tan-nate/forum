class AddRelevantRatingToSupports < ActiveRecord::Migration[6.0]
  def change
    add_column :supports, :relevant_rating, :integer
  end
end
