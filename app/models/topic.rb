class Topic < ApplicationRecord
    has_many :quotes
    has_many :user_topics
    has_many :users, through: :user_topics
    belongs_to :place

    validates :name, format: { with: /\A(?:[A-Za-z]+)(?:[A-Za-z0-9 _]*)\z/,
        message: "of topic only allows letters, numbers, and spaces" }
    validates :name, length: { in: 1..40,
        message: "of topic must be between 1 and 40 characters" }
    
    def last_3_quotes
        lowest_rated = self.quotes.sort_by { |quote| quote.rating }
        highest_rated = lowest_rated.reverse
        least_recent = highest_rated.sort_by { |quote| quote.created_at }
        least_recent.reverse
    end

    def last_3_quotes_limit
        lowest_rated = self.quotes.sort_by { |quote| quote.rating }
        highest_rated = lowest_rated.reverse
        least_recent = highest_rated.sort_by { |quote| quote.created_at }
        least_recent.reverse.take(3)
    end


    def topic_last_3_quotes(user)
        last_3_quotes.select { |quote| quote.user == user }
    end
end
