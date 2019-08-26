class UserPlace < ApplicationRecord
    # t.integer :user_id
    # t.integer :place_id

    belongs_to :user
    belongs_to :place
end