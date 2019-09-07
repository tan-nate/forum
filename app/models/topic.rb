class Topic < ApplicationRecord
    has_many :quotes
    has_many :user_topics
    has_many :users, through: :user_topics
    belongs_to :place

    def first_6_quotes
        self.quotes.limit(6).to_a
    end
end
