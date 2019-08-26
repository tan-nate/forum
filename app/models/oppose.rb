class Oppose < ApplicationRecord
    # t.integer :opposer_id
    # t.integer :opposee_id

    belongs_to :opposer, class_name: 'Quote'
    belongs_to :opposee, class_name: 'Quote'
end