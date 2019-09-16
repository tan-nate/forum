class Place < ApplicationRecord
    has_many :user_places
    has_many :users, through: :user_places
    has_many :topics

    def first_3_topics
        self.topics.limit(3).to_a
    end
end
