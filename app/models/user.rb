class User < ApplicationRecord
    # t.string :username
    # t.integer :points
    # t.string :password_digest

    has_many :user_topics
    has_many :topics, through: :user_topics
end
