class QuoteTopic < ApplicationRecord
    # t.integer :quote_id
    # t.integer :topic_id

    belongs_to :quote
    belongs_to :topic
end