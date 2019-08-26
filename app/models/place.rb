class Place < ApplicationRecord
    # t.string :name

    has_many :user_places
    has_many :users, through: :user_places
    has_many :topics
end
