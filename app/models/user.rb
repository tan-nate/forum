class User < ApplicationRecord
    # t.string :username
    # t.integer :points
    # t.string :password_digest

    has_many :user_topics
    has_many :topics, through: :user_topics
    has_many :user_places
    has_many :places, through: :user_places
end
