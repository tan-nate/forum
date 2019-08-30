class Oppose < ApplicationRecord
    belongs_to :opposer, class_name: 'Quote'
    belongs_to :opposee, class_name: 'Quote'
end