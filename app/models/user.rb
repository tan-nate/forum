class User < ApplicationRecord
    has_secure_password
    acts_as_voter

    has_many :user_topics
    has_many :topics, through: :user_topics
    has_many :user_places
    has_many :places, through: :user_places
    has_many :quotes

    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users

    has_one :clipboard

    validates :username, format: { with: /\A(?=.{2,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9.]+(?<![_.])\z/,
        message: "is not a valid username. 2-20 characters: letters, numbers, and dots" }
    validates :username, uniqueness: true

    def self.most_quotes
        ascending = self.all.sort_by { |user| user.quotes.count }
        ascending.reverse
    end

    def quote_topics
        quotes.collect { |quote| quote.topic }
    end
end
