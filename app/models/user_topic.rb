class UserTopic < ApplicationRecord
    # t.integer :user_id
    # t.integer :topic_id
    
    belongs_to :user
    belongs_to :topic
end