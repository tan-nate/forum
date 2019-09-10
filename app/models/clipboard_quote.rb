class ClipboardQuote < ApplicationRecord
    belongs_to :clipboard
    belongs_to :quote
end
