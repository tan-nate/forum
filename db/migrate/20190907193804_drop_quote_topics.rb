class DropQuoteTopics < ActiveRecord::Migration[6.0]
  def change
    drop_table :quote_topics
  end
end
