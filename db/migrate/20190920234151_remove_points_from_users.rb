class RemovePointsFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :points, :integer
  end
end
