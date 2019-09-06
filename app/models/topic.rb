class Topic < ApplicationRecord
    has_many :quotes
    has_many :user_topics
    has_many :users, through: :user_topics
    belongs_to :place
    has_many :quote_topics
    has_many :quotes, through: :quote_topics

    def first_5_quotes
        self.quotes.limit(5).to_a
    end
end
