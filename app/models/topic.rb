class Topic < ApplicationRecord
    # t.string :name
    # t.integer :place_id

    has_many :quotes
    has_many :user_topics
    has_many :users, through: :user_topics
    belongs_to :place
end
