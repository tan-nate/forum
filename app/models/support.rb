class Support < ApplicationRecord
    # t.integer :supporter_id
    # t.integer :supportee_id

    belongs_to :supporter, class_name: 'Quote'
    belongs_to :supportee, class_name: 'Quote'
end