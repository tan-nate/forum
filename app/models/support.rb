class Support < ApplicationRecord
    belongs_to :supporter, class_name: 'Quote'
    belongs_to :supportee, class_name: 'Quote'
end