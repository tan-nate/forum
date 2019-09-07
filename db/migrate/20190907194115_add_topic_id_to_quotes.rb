class AddTopicIdToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :topic_id, :integer
  end
end
