class Clipboard < ApplicationRecord
    belongs_to :user
    belongs_to :quote
end
