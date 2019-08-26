class CreateQuoteTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :quote_topics do |t|
      t.integer :quote_id
      t.integer :topic_id
    end
  end
end
