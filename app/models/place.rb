class Place < ApplicationRecord
    has_many :user_places
    has_many :users, through: :user_places
    has_many :topics

    def first_5_topics
        self.topics.limit(5).to_a
    end
end
