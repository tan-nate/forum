class Quote < ApplicationRecord
    has_many :supported_quotes, foreign_key: :supporter_id, class_name: 'Support'
    has_many :supportees, through: :supported_quotes
    has_many :supporting_quotes, foreign_key: :supportee_id, class_name: 'Support'
    has_many :supporters, through: :supporting_quotes

    has_many :opposed_quotes, foreign_key: :opposer_id, class_name: 'Oppose'
    has_many :opposees, through: :opposed_quotes
    has_many :opposing_quotes, foreign_key: :opposee_id, class_name: 'Oppose'
    has_many :opposers, through: :opposing_quotes

    belongs_to :user
    belongs_to :topic

    has_many :clipboards_quotes
    has_many :clipboards, through: :clipboards_quotes

    validates :text, length: {in: 200..1000}

    def support_count
        supporters.length
    end

    def oppose_count
        opposers.length
    end
end
