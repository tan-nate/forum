class Oppose < ApplicationRecord
    # t.integer :opposer_id
    # t.integer :opposee_id

    belongs_to :opposer, class_name: 'User'
    belongs_to :opposee, class_name: 'User'
end