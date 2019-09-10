class User < ApplicationRecord
    has_secure_password

    has_many :user_topics
    has_many :topics, through: :user_topics
    has_many :user_places
    has_many :places, through: :user_places
    has_many :quotes

    has_one :clipboard
    has_many :quotes, through: :clipboard
end
