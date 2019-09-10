class Clipboard < ApplicationRecord
    belongs_to :user
    has_many :clipboard_quotes
    has_many :quotes, through: :clipboard_quotes
end
