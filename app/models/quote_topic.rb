class QuoteTopic < ApplicationRecord
    belongs_to :quote
    belongs_to :topic
end