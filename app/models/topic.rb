class Topic < ApplicationRecord
    has_many :quotes
    has_many :user_topics
    has_many :users, through: :user_topics
    belongs_to :place

    validates :name, format: { with: /\A(?:[A-Za-z]+)(?:[A-Za-z0-9 _]*)\z/,
        message: "of topic only allows letters, numbers, and spaces" }
    validates :name, length: { in: 1..40,
        message: "of topic must be between 1 and 40 characters" }

    def first_3_quotes
        self.quotes.limit(3).to_a
    end
end
