class User < ApplicationRecord
    has_secure_password

    has_many :user_topics
    has_many :topics, through: :user_topics
    has_many :user_places
    has_many :places, through: :user_places
    has_many :quotes

    has_one :clipboard

    validates :username, format: { with: /\A(?=.{2,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9.]+(?<![_.])\z/,
        message: "is not a valid username. 2-20 characters: letters, numbers, and dots" }
    validates :username, uniqueness: true
end
